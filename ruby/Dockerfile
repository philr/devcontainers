ARG BASE_IMAGE=ghcr.io/philr/ruby-base:latest

FROM ${BASE_IMAGE}

ARG TARGETARCH
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
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/doc \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/*-*BSD \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/*-AIX \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/*-SunOS \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/*-Windows \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/Darwin \
    && if [[ "$TARGETARCH" = amd64 ]]; then rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/aarch64-*; fi \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/arm-* \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/i386-* \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/loongarch64-* \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/mips64el-* \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/ppc*-* \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/riscv64-* \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/s390x-* \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/sparcv9-* \
    && if [[ "$TARGETARCH" = arm64 ]]; then rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/jni/x86_64-*; fi \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/ruby/gems/*/cache/* \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/lib/ruby/gems/*/doc/* \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/openssl/bin \
    && rm -f "$HOME"/.rbenv/versions/"$VERSION"/openssl/lib/*.a \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/openssl/ssl/man \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/openssl/ssl/misc \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/samples \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/share/man \
    && rm -rf "$HOME"/.rbenv/versions/"$VERSION"/share/ri \
    && shopt -u nullglob