FROM debian:stable

LABEL org.opencontainers.image.source=https://github.com/philr/devcontainers

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get --yes install \
         autoconf \
         bison \
         bzip2 \
         curl \
         gcc \
         git \
         g++ \
         libc6-dev \
         libffi-dev \
         libgdbm-dev \
         libgmp-dev \
         libncurses-dev \
         libreadline-dev \
         libssl-dev \
         libyaml-dev \
         openjdk-21-jre-headless \
         rdfind \
         make \
         zlib1g-dev \
    && apt-get dist-clean

RUN groupadd devcontainer \
    && useradd devcontainer -g devcontainer -m -s /bin/bash

USER devcontainer

RUN git clone --depth=1 https://github.com/rbenv/rbenv.git ~/.rbenv \
    && git clone --depth=1 https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build \
    && git -C ~/.rbenv/plugins/ruby-build remote add -t ruby-builder-legacy-support --no-tags legacy https://github.com/philr/ruby-build.git \
    && git -C ~/.rbenv/plugins/ruby-build fetch --depth=1 legacy \
    && git -C ~/.rbenv/plugins/ruby-build switch -c ruby-builder-legacy-support legacy/ruby-builder-legacy-support \
    && git -C ~/.rbenv/plugins/ruby-build switch master \
    && ~/.rbenv/bin/rbenv init bash

COPY patches ~/.rbenv-patches

SHELL ["/bin/bash", "-c"]

RUN eval "$(~/.rbenv/bin/rbenv init - --no-rehash bash)" \
    && export RUBY_CONFIGURE_OPTIONS=--disable-install-doc \
    && rbenv install 4.0.0 \
    && rbenv global 4.0.0 \
    #&& rbenv install 3.4.8 \
    #&& rbenv install 3.3.9 \
    #&& rbenv install 3.2.9 \
    #&& rbenv install 3.1.7 \
    #&& rbenv install 3.0.7 \
    #&& rbenv install 2.7.8 \
    #&& rbenv install 2.6.9 \
    #&& RBENV_VERSION=2.6.9 gem install bundler -v '~> 1' --no-document \
    #&& rbenv install 2.5.9 \
    #&& RBENV_VERSION=2.5.9 gem install bundler -v '~> 1' --no-document \
    #&& rbenv install 2.4.9 \
    #&& RBENV_VERSION=2.4.9 gem install bundler -v '~> 1' --no-document \
    #&& rbenv install 2.3.8 \
    #&& RBENV_VERSION=2.3.8 gem install bundler -v '~> 1' --no-document \
    #&& export warnflags=-Wno-error=implicit-function-declaration \
    #&& rbenv install verbose 2.2.9 \
    #&& RBENV_VERSION=2.2.9 gem install bundler -v '~> 1' --no-document \
    #&& rbenv install 2.1.9 \
    #&& RBENV_VERSION=2.1.9 gem install bundler -v '~> 1' --no-document \
    #&& rbenv install jruby-10.0.2.0 \
    #&& rbenv install jruby-9.4.14.0 \
    #&& rbenv install jruby-9.3.15.0 \
    #&& rbenv install jruby-9.2.21.0 \
    && rbenv install --verbose jruby-9.1.17.0 \
    && RBENV_VERSION=jruby-9.1.17.0 gem install bundler -v '~> 1' --no-document \
    && rbenv install truffleruby-25.0.0 \
    && git -C ~/.rbenv/plugins/ruby-build switch ruby-builder-legacy-support \
    && rbenv install 2.0.0-p648 \
    && RBENV_VERSION=2.0.0-p648 gem install bundler -v '~> 1' --no-document \
    && rbenv install 1.9.3-p551 \
    && RBENV_VERSION=1.9.3-p551 gem install bundler -v '~> 1' --no-rdoc --no-ri \
    && rbenv install --patch 1.8.7-p375 < ~/.rbenv-patches/1.8.7-enable-ssl-sni.patch \
    && RBENV_VERSION=1.8.7-p375 gem install bundler -v '~> 1' --no-rdoc --no-ri \
    && rbenv install jruby-9.0.5.0 \
    && RBENV_VERSION=jruby-9.0.5.0 gem install bundler -v '~> 1' --no-document \
    && git -C ~/.rbenv/plugins/ruby-build switch master \
    && rdfind -makehardlinks true ~/.rbenv \
    && rm /tmp/ruby-build*.log