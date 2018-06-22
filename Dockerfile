FROM centos:7

ARG VAGRANT_VER=2.1.1
ARG VAGRANT_CACHIER_VER=1.2.1
ARG DOCKER_VER=18.03.1-ce
ARG DOCKER_COMPOSE_VER=1.21.1

RUN yum install -y git openssh-clients https://releases.hashicorp.com/vagrant/${VAGRANT_VER}/vagrant_${VAGRANT_VER}_x86_64.rpm &&\
    vagrant plugin install vagrant-cachier --plugin-version ${VAGRANT_CACHIER_VER} &&\
    curl -sL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VER}.tgz | tar -xz -C /tmp && mv /tmp/docker/* /usr/bin && rm -rf /tmp/docker &&\
    curl -sL https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VER}/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose && chmod +x /usr/bin/docker-compose

LABEL maintainer="Patrick Double <pat@patdouble.com>" \
    org.label-schema.docker.dockerfile="$DOCKERFILE_PATH/Dockerfile" \
    org.label-schema.license="Apache2.0" \
    org.label-schema.name="Image for use by CI environments to validate the Vagrant build of a project environment. Vagrant ${VAGRANT_VER}, Docker ${DOCKER_VER}, Docker Compose ${DOCKER_COMPOSE_VER}." \
    org.label-schema.url="https://bitbucket.org/double16/vagrant-build-base" \
    org.label-schema.vcs-ref="$SOURCE_COMMIT" \
    org.label-schema.vcs-type="$SOURCE_TYPE" \
    org.label-schema.vcs-url="https://bitbucket.org/double16/vagrant-build-base.git"
