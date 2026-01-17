ARG USER=philr
ARG RUBY_BASE=ruby-base

FROM ghcr.io/${USER}/${RUBY_BASE}

ARG VERSION
ARG LEGACY=0
ARG BUNDLER_VERSION=
ARG GEM_NO_DOCUMENT=--no-document
ARG WARN_FLAGS=
ARG PATCH=
ENV JAVA_HOME=/usr/lib/jvm/temurin-21-jre-amd64

COPY --chown=devcontainer:devcontainer patches .rbenv-patches/

RUN if [[ "$USE_LEGACY_RUBY_BUILD" -eq 1 ]]; then git -C $HOME/.rbenv/plugins/ruby-build switch ruby-builder-legacy-support; fi \
    && git -C $HOME/.rbenv/plugins/ruby-build pull \
    && eval "$($HOME/.rbenv/bin/rbenv init - --no-rehash bash)" \
    && if [[ -n "$PATCH" ]]; \
        then RUBY_CONFIGURE_OPTIONS=--disable-install-doc warnflags="$WARN_FLAGS" rbenv install --verbose --patch "$VERSION" < "$HOME/.rbenv-patches/$PATCH"; \
        else RUBY_CONFIGURE_OPTIONS=--disable-install-doc warnflags="$WARN_FLAGS" rbenv install --verbose "$VERSION"; \
    fi \
    && rbenv global "$VERSION" \
    && if [[ -n "$BUNDLER_VERSION" ]]; then gem install bundler -v "$BUNDLER_VERSION" "$GEM_NO_DOCUMENT"; fi