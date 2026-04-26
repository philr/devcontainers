ARG BASE_IMAGE=ghcr.io/philr/ruby-base:latest

FROM ${BASE_IMAGE}

ARG TARGETARCH
ARG REPOSITORY=philr/devcontainers
ARG RBENV_VERSIONS=4.0.1
ARG AMD64_ONLY_RBENV_VERSIONS=
ARG RBENV_GLOBAL_VERSION=4.0.1
ARG RUBY_OS=ubuntu-24.04

RUN if [[ $TARGETARCH = amd64 ]]; then ALL_VERSIONS="$RBENV_VERSIONS $AMD64_ONLY_RBENV_VERSIONS"; else ALL_VERSIONS="$RBENV_VERSIONS"; fi \
    && for version in $ALL_VERSIONS; do url="https://github.com/$REPOSITORY/releases/download/ruby-builds/$version-$RUBY_OS-$TARGETARCH.tar.xz" && echo $url && curl --location --retry 5 "$url" | tar xJ -C "$HOME/.rbenv/versions"; done \
    && rdfind -makehardlinks true -makeresultsfile false -checksum sha256 "$HOME/.rbenv/versions" \
    && eval "$($HOME/.rbenv/bin/rbenv init - --no-rehash bash)" \
    && rbenv global "$RBENV_GLOBAL_VERSION" \
    && rbenv rehash