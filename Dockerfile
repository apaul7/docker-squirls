FROM ubuntu:focal

LABEL \
  description="Image for running Squirls, https://github.com/TheJacksonLaboratory/Squirls" \
  maintainer="Alexander Paul<alex.paul@wustl.edu>"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    openjdk-11-jre-headless \
    unzip \
    vim \
    wget && \
    apt-get clean

WORKDIR /tmp

ENV SQUIRLS_VERSION=2.0.0
ENV SQUIRLS_INSTALL=/opt/local/squirls

RUN wget https://github.com/TheJacksonLaboratory/Squirls/releases/download/v${SQUIRLS_VERSION}/squirls-cli-${SQUIRLS_VERSION}-distribution.zip && \
    mkdir -p ${SQUIRLS_INSTALL} && \
    unzip -d $SQUIRLS_INSTALL squirls-cli-${SQUIRLS_VERSION}-distribution.zip && \
    rm -rf /tmp

WORKDIR /
