#!/bin/sh

prog=$(basename $0)
if ! [[ -S /var/run/docker.sock ]]
then
	echo "$prog: there are no running docker" >&2
	exit 2
fi

cd $(dirname $0)
PATH=$(pwd):$PATH
plugin=$(basename $(pwd))
if ! which -s $plugin
then
	echo "$prog: $plugin is not installed" >&2
	exit 2
fi

# By default, LDAP_DOMAIN=example.org and LDAP_ORGANISATION=Example Inc
docker run --name test-$plugin -p 389:389 -d \
	-e 'LDAP_ADMIN_PASSWORD=passpass' \
	-v $(pwd)/ldif:/container/service/slapd/assets/config/bootstrap/ldif/custom \
	osixia/openldap --copy-service
trap 'docker stop test-$plugin; docker rm test-$plugin; exit' EXIT
sleep 10

base_dn='dc=example,dc=org'
if $plugin -bind "cn=monitor,$base_dn" -pw passpass
then
	echo OK
else
	echo FAIL
fi
