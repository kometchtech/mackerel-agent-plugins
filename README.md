はじめに
=====================

このレポジトリは、公式がARM64/Aarch64に対応したパッケージを作成していないため、Aarch64向けにbuildするように対応改変したものです。


mackerel-agent-plugins  [![Build Status](https://travis-ci.org/mackerelio/mackerel-agent-plugins.svg?branch=master)](https://travis-ci.org/mackerelio/mackerel-agent-plugins)
======================

This is the official plugin pack for [mackerel-agent](https://github.com/mackerelio/mackerel-agent), a piece of software which is installed on your hosts to collect metrics and events and send them to [Mackerel](https://mackerel.io).

Detailed specs of plugins can be viewed here: ENG [mackerel-agent specifications](https://mackerel.io/docs/entry/spec/agent), JPN [mackerel-agent 仕様](https://mackerel.io/ja/docs/entry/spec/agent).

Documentation for each plugin is located in its respective sub directory.

* [mackerel-plugin-accesslog](./mackerel-plugin-accesslog/README.md)
* [mackerel-plugin-apache2](./mackerel-plugin-apache2/README.md)
* [mackerel-plugin-aws-cloudfront](./mackerel-plugin-aws-cloudfront/README.md)
* [mackerel-plugin-aws-dynamodb](./mackerel-plugin-aws-dynamodb/README.md)
* [mackerel-plugin-aws-ec2-cpucredit](./mackerel-plugin-aws-ec2-cpucredit/README.md)
* [mackerel-plugin-aws-ec2-ebs](./mackerel-plugin-aws-ec2-ebs/README.md)
* [mackerel-plugin-aws-elasticache](./mackerel-plugin-aws-elasticache/README.md)
* [mackerel-plugin-aws-elasticsearch](./mackerel-plugin-aws-elasticsearch/README.md)
* [mackerel-plugin-aws-elb](./mackerel-plugin-aws-elb/README.md)
* [mackerel-plugin-aws-kinesis-streams](./mackerel-plugin-aws-kinesis-streams/README.md)
* [mackerel-plugin-aws-lambda](./mackerel-plugin-aws-lambda/README.md)
* [mackerel-plugin-aws-rds](./mackerel-plugin-aws-rds/README.md)
* [mackerel-plugin-aws-s3-requests](./mackerel-plugin-aws-s3-requests/README.md)
* [mackerel-plugin-aws-ses](./mackerel-plugin-aws-ses/README.md)
* [mackerel-plugin-conntrack](./mackerel-plugin-conntrack/README.md)
* [mackerel-plugin-docker](./mackerel-plugin-docker/README.md)
* [mackerel-plugin-elasticsearch](./mackerel-plugin-elasticsearch/README.md)
* [mackerel-plugin-fluentd](./mackerel-plugin-fluentd/README.md)
* [mackerel-plugin-flume](./mackerel-plugin-flume/README.md)
* [mackerel-plugin-gostats](./mackerel-plugin-gostats/README.md)
* [mackerel-plugin-graphite](./mackerel-plugin-graphite/README.md)
* [mackerel-plugin-h2o](./mackerel-plugin-h2o/README.md)
* [mackerel-plugin-haproxy](./mackerel-plugin-haproxy/README.md)
* [mackerel-plugin-inode](./mackerel-plugin-inode/README.md)
* [mackerel-plugin-jmx-jolokia](./mackerel-plugin-jmx-jolokia/README.md)
* [mackerel-plugin-jvm](./mackerel-plugin-jvm/README.md)
* [mackerel-plugin-linux](./mackerel-plugin-linux/README.md)
* [mackerel-plugin-mailq](./mackerel-plugin-mailq/README.md)
* [mackerel-plugin-mcrouter](./mackerel-plugin-mcrouter/README.md)
* [mackerel-plugin-memcached](./mackerel-plugin-memcached/README.md)
* [mackerel-plugin-mongodb](./mackerel-plugin-mongodb/README.md)
* [mackerel-plugin-mssql](./mackerel-plugin-mssql/README.md)
* [mackerel-plugin-multicore](./mackerel-plugin-multicore/README.md)
* [mackerel-plugin-munin](./mackerel-plugin-munin/README.md)
* [mackerel-plugin-murmur](./mackerel-plugin-murmur/README.md)
* [mackerel-plugin-mysql](./mackerel-plugin-mysql/README.md)
* [mackerel-plugin-nginx](./mackerel-plugin-nginx/README.md)
* [mackerel-plugin-nvidia-smi](./mackerel-plugin-nvidia-smi/README.md)
* [mackerel-plugin-openldap](./mackerel-plugin-openldap/README.md)
* [mackerel-plugin-php-apc](./mackerel-plugin-php-apc/README.md)
* [mackerel-plugin-php-fpm](./mackerel-plugin-php-fpm/README.md)
* [mackerel-plugin-php-opcache](./mackerel-plugin-php-opcache/README.md)
* [mackerel-plugin-plack](./mackerel-plugin-plack/README.md)
* [mackerel-plugin-postgres](./mackerel-plugin-postgres/README.md)
* [mackerel-plugin-proc-fd](./mackerel-plugin-proc-fd/README.md)
* [mackerel-plugin-rabbitmq](./mackerel-plugin-rabbitmq/README.md)
* [mackerel-plugin-rack-stats](./mackerel-plugin-rack-stats/README.md)
* [mackerel-plugin-redash](./mackerel-plugin-redash/README.md)
* [mackerel-plugin-redis](./mackerel-plugin-redis/README.md)
* [mackerel-plugin-sidekiq](./mackerel-plugin-sidekiq/README.md)
* [mackerel-plugin-snmp](./mackerel-plugin-snmp/README.md)
* [mackerel-plugin-solr](./mackerel-plugin-solr/README.md)
* [mackerel-plugin-squid](./mackerel-plugin-squid/README.md)
* [mackerel-plugin-td-table-count](./mackerel-plugin-td-table-count/README.md)
* [mackerel-plugin-trafficserver](./mackerel-plugin-trafficserver/README.md)
* [mackerel-plugin-twemproxy](./mackerel-plugin-twemproxy/README.md)
* [mackerel-plugin-unicorn](./mackerel-plugin-unicorn/README.md)
* [mackerel-plugin-uptime](./mackerel-plugin-uptime/README.md)
* [mackerel-plugin-uwsgi-vassal](./mackerel-plugin-uwsgi-vassal/README.md)
* [mackerel-plugin-varnish](./mackerel-plugin-varnish/README.md)
* [mackerel-plugin-windows-process-stats](./mackerel-plugin-windows-process-stats/README.md)
* [mackerel-plugin-windows-server-sessions](./mackerel-plugin-windows-server-sessions/README.md)
* [mackerel-plugin-xentop](./mackerel-plugin-xentop/README.md)


Caution
=======

Some plugins may not work on CentOS/RedHat 5 because the golang compiler (gc) doesn't support the old kernel.
(https://golang.org/doc/install)

Some plugins are not contained in rpm and deb packages. If you want to use them, build them.

License
=======
```
Copyright 2014 Hatena Co., Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
