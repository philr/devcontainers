ARG USER=philr

FROM ghcr.io/${USER}/ruby-4.0.1 AS ruby-4.0
FROM ghcr.io/${USER}/ruby-3.3.9 AS ruby-3.3
#FROM ghcr.io/${USER}/ruby-3.2.10 AS ruby-3.2
#FROM ghcr.io/${USER}/ruby-3.1.7 AS ruby-3.1
#FROM ghcr.io/${USER}/ruby-3.0.7 AS ruby-3.0
#FROM ghcr.io/${USER}/ruby-2.7.8 AS ruby-2.7
#FROM ghcr.io/${USER}/ruby-2.6.9 AS ruby-2.6
#FROM ghcr.io/${USER}/ruby-2.5.9 AS ruby-2.5
#FROM ghcr.io/${USER}/ruby-2.4.9 AS ruby-2.4
#FROM ghcr.io/${USER}/ruby-2.3.8 AS ruby-2.3
#FROM ghcr.io/${USER}/ruby-2.2.8 AS ruby-2.2
#FROM ghcr.io/${USER}/ruby-2.1.9 AS ruby-2.1
#FROM ghcr.io/${USER}/ruby-2.0.0-p648 AS RUBY-2.0
#FROM ghcr.io/${USER}/ruby-1.9.3-p551 AS RUBY-1.9
#FROM ghcr.io/${USER}/ruby-1.8.7-p375 AS RUBY-1.8
#FROM ghcr.io/${USER}/jruby-10.0.2.0 AS jruby-10.0
#FROM ghcr.io/${USER}/jruby-9.4.14.0 AS jruby-9.4
#FROM ghcr.io/${USER}/jruby-9.3.15.0 AS jruby-9.3
#FROM ghcr.io/${USER}/jruby-9.2.21.0 AS jruby-9.2
#FROM ghcr.io/${USER}/jruby-9.1.17.0 AS jruby-9.1
#FROM ghcr.io/${USER}/jruby-9.0.5.0 AS jruby-9.0
#FROM ghcr.io/${USER}/truffleruby-25.0.0 AS truffleruby-25

FROM ghcr.io/${USER}/jruby-base

COPY --from=ruby-4.0 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
COPY --from=ruby-3.3 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=ruby-3.2 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=ruby-3.1 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=ruby-3.0 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=ruby-2.7 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=ruby-2.6 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=ruby-2.5 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=ruby-2.4 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=ruby-2.3 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=ruby-2.2 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=ruby-2.1 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=ruby-2.0 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=ruby-1.9 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=ruby-1.8 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=jruby-10.0 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=jruby-9.4 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=jruby-9.3 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=jruby-9.2 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=jruby-9.1 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=jruby-9.0 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/
#COPY --from=truffleruby-25 --chown=devcontainer:devcontainer /home/devcontainer/.rbenv/versions .rbenv/versions/

RUN eval "$($HOME/.rbenv/bin/rbenv init - --no-rehash bash)" \
    && rbenv global 4.0.1 \
    && rbenv rehash