ARG USER=philr

FROM ghcr.io/${USER}/ruby-base

USER root

RUN curl --retry 5 https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor > /usr/share/keyrings/adoptium.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/adoptium.gpg] https://packages.adoptium.net/artifactory/deb/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/adoptium.list \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get --yes --no-install-recommends install \
        temurin-8-jre \
        temurin-21-jre \
    && apt-get dist-clean

ENV JAVA_HOME_8=/usr/lib/jvm/temurin-8-jre-amd64
ENV JAVA_HOME_21=/usr/lib/jvm/temurin-21-jre-amd64
ENV JAVA_HOME=/usr/lib/jvm/temurin-21-jre-amd64

USER devcontainer