VERSION = 0.55.1
VERBOSE_FLAG = $(if $(VERBOSE),-verbose)
CURRENT_REVISION = $(shell git rev-parse --short HEAD)

GOOS   ?= linux
GOARCH ?= arm64
BINDIR  = build/$(GOOS)/$(GOARCH)

all: lint cover testconvention rpm deb

.SECONDEXPANSION:
$(BINDIR)/mackerel-plugin-%: mackerel-plugin-%/main.go $$(wildcard mackerel-plugin-%/lib/*.go)
	@if [ ! -d $(BINDIR) ]; then mkdir -p $(BINDIR); fi
	go build -ldflags="-s -w" -o $@ ./`basename $@`

build: deps
	for i in mackerel-plugin-*; do \
	  $(MAKE) $(BINDIR)/$$i; \
	done

build/mackerel-plugin: deps
	mkdir -p build
	go build -ldflags="-s -w -X main.gitcommit=$(CURRENT_REVISION)" \
	  -o build/mackerel-plugin

test: testgo lint testconvention

testgo: testdeps
	go test $(VERBOSE_FLAG) ./...

testconvention:
	prove -r t/
	go generate ./... && git diff --exit-code || \
	  (echo 'please `go generate ./...` and commit them' && false)

deps:
	go get -d -v ./...

testdeps:
	go get -d -v -t ./...
	go get golang.org/x/lint/golint  \
	  golang.org/x/tools/cmd/cover   \
	  github.com/pierrre/gotestcover \
	  github.com/mattn/goveralls

check-release-deps:
	@have_error=0; \
	for command in cpanm hub ghch gobump; do \
	  if ! command -v $$command > /dev/null; then \
	    have_error=1; \
	    echo "\`$$command\` command is required for releasing"; \
	  fi; \
	done; \
	test $$have_error = 0

lint: testdeps
	go vet ./...
	golint -set_exit_status ./...

cover: testdeps
	gotestcover -v -covermode=count -coverprofile=.profile.cov -parallelpackages=4 ./...

rpm: rpm-v1 rpm-v2

rpm-v1:
	$(MAKE) build GOOS=linux GOARCH=arm
	rpmbuild --define "_sourcedir `pwd`" --define "_bindir build/linux/arm" \
	  --define "_version ${VERSION}" --define "buildarch noarch" \
		--target armv7l -bb packaging/rpm/mackerel-agent-plugins.spec
	$(MAKE) build GOOS=linux GOARCH=arm64
	rpmbuild --define "_sourcedir `pwd`" --define "_bindir build/linux/arm64" \
	  --define "_version ${VERSION}" --define "buildarch noarch" \
	  --target aarch64 -bb packaging/rpm/mackerel-agent-plugins.spec

rpm-v2:
	$(MAKE) build/mackerel-plugin GOOS=linux GOARCH=arm64
	rpmbuild --define "_sourcedir `pwd`"  --define "_version ${VERSION}" \
	  --define "buildarch noarch" --define "dist .el7.centos" \
	  --target aarch64 -bb packaging/rpm/mackerel-agent-plugins-v2.spec
	rpmbuild --define "_sourcedir `pwd`"  --define "_version ${VERSION}" \
	  --define "buildarch noarch" --define "dist .amzn2" \
	  --target aarch64 -bb packaging/rpm/mackerel-agent-plugins-v2.spec

deb: deb-v1 deb-v2

deb-v1:
	$(MAKE) build GOOS=linux GOARCH=arm
	for i in `cat packaging/deb/debian/source/include-binaries`; do \
	  cp build/linux/arm/`basename $$i` packaging/deb/debian/; \
	done
	cd packaging/deb && debuild --no-tgz-check -rfakeroot -uc -us -aarmhf

deb-v2:
	$(MAKE) build/mackerel-plugin GOOS=linux GOARCH=arm64
	cp build/mackerel-plugin packaging/deb-v2/debian/
	cd packaging/deb-v2 && debuild --no-tgz-check -rfakeroot -uc -us -aarm64

release: check-release-deps
	(cd tool && cpanm -qn --installdeps .)
	perl tool/create-release-pullrequest

clean:
	@if [ -d build ]; then rm -rfv build; fi

.PHONY: all build test testgo deps testdeps rpm rpm-v1 rpm-v2 deb deb-v1 deb-v2 clean release lint cover testconvention
