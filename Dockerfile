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

ENV SQUIRLS_VERSION=1.0.0
ENV SQUIRLS_INSTALL=/opt/local/squirls

RUN wget https://github.com/TheJacksonLaboratory/Squirls/releases/download/v${SQUIRLS_VERSION}/squirls-cli-${SQUIRLS_VERSION}-distribution.zip && \
    unzip squirls-cli-${SQUIRLS_VERSION}-distribution.zip && \
    mkdir -p ${SQUIRLS_INSTALL} && \
    mv squirls-cli-${SQUIRLS_VERSION}/* ${SQUIRLS_INSTALL}/ && \
    rm -rf /tmp

WORKDIR /
