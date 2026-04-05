ARG USER=philr
ARG RUBY_BASE=ruby-base

FROM ghcr.io/${USER}/${RUBY_BASE}

ARG VERSION
ARG LEGACY=0
ARG INSTALL_BUNDLER_VERSION=
ARG WARN_FLAGS=
ARG PATCH=
ARG POST_PATCH=
ARG CPP_FLAGS=-DENABLE_PATH_CHECK=0
ARG JAVA_HOME
ENV JAVA_HOME=$JAVA_HOME

COPY --chown=devcontainer:devcontainer patches .rbenv-patches/

RUN if [[ "$LEGACY" -eq 1 ]]; then git -C $HOME/.rbenv/plugins/ruby-build switch ruby-builder-legacy-support; fi \
    && git -C $HOME/.rbenv/plugins/ruby-build pull \
    && eval "$($HOME/.rbenv/bin/rbenv init - --no-rehash bash)" \
    && if [[ -n "$PATCH" ]]; \
        then RUBY_CONFIGURE_OPTS="--disable-install-doc --disable-install-rdoc" CPPFLAGS="$CPP_FLAGS" warnflags="$WARN_FLAGS" rbenv install --verbose --patch "$VERSION" < "$HOME/.rbenv-patches/$PATCH"; \
        else RUBY_CONFIGURE_OPTS="--disable-install-doc --disable-install-rdoc" CPPFLAGS="$CPP_FLAGS" warnflags="$WARN_FLAGS" rbenv install --verbose "$VERSION"; \
    fi \
    && rbenv global "$VERSION" \
    && if [[ -n "$INSTALL_BUNDLER_VERSION" ]]; then if gem help install | grep -q no-document; then gem install bundler -v "$INSTALL_BUNDLER_VERSION" --no-document; else gem install bundler -v "$INSTALL_BUNDLER_VERSION" --no-rdoc --no-ri; fi; fi \
    && if [[ -n "$POST_PATCH" ]]; then patch -p2 -d "$(dirname $(gem which bundler))" < "$HOME/.rbenv-patches/$POST_PATCH"; fi