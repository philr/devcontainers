ARG BASE_IMAGE=ghcr.io/philr/ruby-base:latest

FROM ${BASE_IMAGE}

ARG TARGETARCH
ARG REPOSITORY=philr/devcontainers
ARG RUBY_OS=ubuntu-24.04

RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/4.0.5-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/3.4.9-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/3.3.11-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/3.2.11-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/3.1.7-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/3.0.7-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/2.7.8-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/2.6.10-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/2.5.9-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/2.4.10-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/2.3.8-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/2.2.10-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/2.1.10-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/2.0.0-p648-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/1.9.3-p551-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/1.8.7-p375-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/jruby-10.1.0.0-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/jruby-10.0.5.0-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/jruby-9.4.14.0-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/jruby-9.3.15.0-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/jruby-9.2.21.0-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/jruby-9.1.17.0-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"
RUN if [[ $TARGETARCH = amd64 ]]; then curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/jruby-9.0.5.0-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"; fi
RUN curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/truffleruby-34.0.1-$RUBY_OS-$TARGETARCH.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"

RUN eval "$($HOME/.rbenv/bin/rbenv init - --no-rehash bash)" \
    && rbenv global "4.0.5" \
    && rbenv rehash