ARG USER=philr

FROM ubuntu:24.04

ARG USER

LABEL org.opencontainers.image.source=https://github.com/${USER}/devcontainers

SHELL ["/bin/bash", "-c"]

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get --yes --no-install-recommends dist-upgrade \
    && apt-get --yes --no-install-recommends install \
        autoconf \
        bison \
        bzip2 \
        ca-certificates \
        curl \
        gcc \
        git \
        gpg \
        g++ \
        libc6-dev \
        libffi-dev \
        libgdbm-dev \
        libgmp-dev \
        libncurses-dev \
        libreadline-dev \
        libssl-dev \
        libyaml-dev \
        lsb-release \
        make \
        patch \
        zlib1g-dev \
    && apt-get autoremove --yes \
    && apt-get dist-clean

RUN userdel -r ubuntu \
    && useradd -m -s /bin/bash -U devcontainer

USER devcontainer
ENV HOME=/home/devcontainer
WORKDIR /home/devcontainer

RUN git clone --depth=1 https://github.com/rbenv/rbenv.git $HOME/.rbenv \
    && git clone --depth=1 https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build \
    && git -C $HOME/.rbenv/plugins/ruby-build remote add -t ruby-builder-legacy-support --no-tags legacy https://github.com/philr/ruby-build.git \
    && git -C $HOME/.rbenv/plugins/ruby-build fetch --depth=1 legacy \
    && git -C $HOME/.rbenv/plugins/ruby-build branch --track ruby-builder-legacy-support legacy/ruby-builder-legacy-support \
    && $HOME/.rbenv/bin/rbenv init bash \
    && mkdir $HOME/.rbenv/versions