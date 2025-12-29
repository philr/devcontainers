FROM debian:stable

LABEL org.opencontainers.image.source=https://github.com/philr/devcontainers

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get --yes install \
         autoconf \
         bison \
         curl \
         gcc \
         git \
         libc6-dev \
         libffi-dev \
         libgdbm-dev \
         libgmp-dev \
         libncurses-dev \
         libreadline-dev \
         libssl-dev \
         libyaml-dev \
         make \
         zlib1g-dev \
    && apt-get dist-clean

RUN groupadd devcontainer \
    && useradd devcontainer -g devcontainer -m -s /bin/bash

USER devcontainer

RUN git clone --depth=1 https://github.com/rbenv/rbenv.git ~/.rbenv \
    && git clone --depth=1 https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build \
    && ~/.rbenv/bin/rbenv init bash

SHELL ["/bin/bash", "-c"]

RUN eval "$(~/.rbenv/bin/rbenv init - --no-rehash bash)" \
    && rbenv install 4.0.0 \
    && rbenv global 4.0.0 \
    && rm /tmp/ruby-build*.log