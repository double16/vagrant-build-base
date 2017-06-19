FROM centos:7
MAINTAINER Patrick Double <pat@patdouble.com>

ARG VAGRANT_VER=1.9.5
ARG DOCKER_VER=17.05.0-ce
ARG DOCKER_COMPOSE_VER=1.13.0

RUN yum install -y https://releases.hashicorp.com/vagrant/${VAGRANT_VER}/vagrant_${VAGRANT_VER}_x86_64.rpm

RUN vagrant plugin install vagrant-cachier --plugin-version 1.2.1

RUN curl -sL https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VER}.tgz | tar -xz -C /tmp && mv /tmp/docker/* /usr/bin && rm -rf /tmp/docker &&\
    curl -sL https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VER}/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose && chmod +x /usr/bin/docker-compose

