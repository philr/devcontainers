ARG BASE_IMAGE=ghcr.io/philr/ruby-base:latest

FROM ${BASE_IMAGE}

ARG USER
ARG REPOSITORY=philr/devcontainers
ARG RBENV_VERSIONS=4.0.1
ARG RBENV_GLOBAL_VERSION=4.0.1
ARG PLATFORM=ubuntu-24.04

RUN for version in $RBENV_VERSIONS; do curl --location --retry 5 "https://github.com/$REPOSITORY/releases/download/ruby-builds/$version-$PLATFORM-amd64.tar.xz" | tar xJ -C "$HOME/.rbenv/versions"; done \
    && rdfind -makehardlinks true -makeresultsfile false -checksum sha256 "$HOME/.rbenv/versions" \
    && eval "$($HOME/.rbenv/bin/rbenv init - --no-rehash bash)" \
    && rbenv global "$RBENV_GLOBAL_VERSION" \
    && rbenv rehash