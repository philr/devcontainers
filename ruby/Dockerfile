ARG BASE_IMAGE=ghcr.io/philr/ruby-base:latest

FROM ${BASE_IMAGE}

ARG VERSION
ARG LEGACY=0
ARG INSTALL_BUNDLER_VERSION=
ARG EXTRA_CONFIGURE_OPTS=
ARG CPP_FLAGS=-DENABLE_PATH_CHECK=0
ARG WARN_FLAGS=
ARG PATCH=
ARG POST_PATCH=
ARG JAVA_HOME
ARG JRUBY_OPTS=

ENV JAVA_HOME=$JAVA_HOME
ENV JRUBY_OPTS=$JRUBY_OPTS

COPY --chown=devcontainer:devcontainer patches .rbenv-patches/

RUN if [[ "$LEGACY" -eq 1 ]]; then git -C $HOME/.rbenv/plugins/ruby-build switch ruby-builder-legacy-support; fi \
    && git -C $HOME/.rbenv/plugins/ruby-build pull \
    && eval "$($HOME/.rbenv/bin/rbenv init - --no-rehash bash)" \
    && if [[ -n "$PATCH" ]]; \
        then RUBY_CONFIGURE_OPTS="--disable-install-doc --disable-install-rdoc $EXTRA_CONFIGURE_OPTS" CPPFLAGS="$CPP_FLAGS" warnflags="$WARN_FLAGS" rbenv install --verbose --patch "$VERSION" < "$HOME/.rbenv-patches/$PATCH"; \
        else RUBY_CONFIGURE_OPTS="--disable-install-doc --disable-install-rdoc $EXTRA_CONFIGURE_OPTS" CPPFLAGS="$CPP_FLAGS" warnflags="$WARN_FLAGS" rbenv install --verbose "$VERSION"; \
    fi \
    && rbenv global "$VERSION" \
    && if [[ -n "$INSTALL_BUNDLER_VERSION" ]]; then if gem help install | grep -q no-document; then gem install bundler -v "$INSTALL_BUNDLER_VERSION" --no-document; else gem install bundler -v "$INSTALL_BUNDLER_VERSION" --no-rdoc --no-ri; fi; fi \
    && if [[ -n "$POST_PATCH" ]]; then patch -p2 -d "$(dirname $(gem which bundler))" < "$HOME/.rbenv-patches/$POST_PATCH"; fi \
    && shopt -s nullglob \
    && rm -rf "$HOME"/.rbenv/versions/*/lib/ruby/gems/*/cache/* \
    && rm -rf "$HOME"/.rbenv/versions/*/lib/ruby/gems/*/doc/* \
    && shopt -u nullglob