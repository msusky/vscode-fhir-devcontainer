FROM mcr.microsoft.com/devcontainers/base:alpine as fsh-sushi-alpine

ARG SUSHI_VERSION=

RUN apk update \
    && apk add nodejs npm

# Update sources for nodejs
# RUN curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

# RUN apt update \
#     && apt install -y \
#     nodejs

RUN npm install -g fsh-sushi@${SUSHI_VERSION}


FROM mcr.microsoft.com/devcontainers/base:ubuntu as fsh-sushi-ubuntu

ARG SUSHI_VERSION=

# Update sources for nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

RUN apt update \
    && apt install -y \
    nodejs

RUN npm install -g fsh-sushi@${SUSHI_VERSION}


ARG SUSHI_VERSION=
FROM fsh-sushi-alpine AS ig-publisher-alpine

RUN apk update \
    && apk add --no-cache \
    openjdk17-jdk \
    ruby-dev \
    msttcorefonts-installer \
    fontconfig

RUN gem install jekyll
RUN update-ms-fonts

RUN wget -q -P /workspaces https://raw.githubusercontent.com/HL7/ig-publisher-scripts/main/_updatePublisher.sh \
    && chmod a+x /workspaces/_updatePublisher.sh

RUN wget -q -P /workspaces https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar \
    && printf "#!/bin/bash\njava -jar ../validator_cli.jar -html-output validation.html fsh-generated/resources" >> /workspaces/validate.sh \
    && chmod a+x /workspaces/validate.sh


ARG SUSHI_VERSION=
FROM fsh-sushi-ubuntu AS ig-publisher-ubuntu

RUN apt update \
    && apt install -y \
    openjdk-17-jdk \
    ruby-full \
    build-essential \
    zlib1g-dev

RUN gem install jekyll

RUN wget -q -P /workspaces https://raw.githubusercontent.com/HL7/ig-publisher-scripts/main/_updatePublisher.sh \
    && chmod a+x /workspaces/_updatePublisher.sh

RUN wget -q -P /workspaces https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar \
    && printf "#!/bin/bash\njava -jar ../validator_cli.jar -html-output validation.html fsh-generated/resources" >> /workspaces/validate.sh \
    && chmod a+x /workspaces/validate.sh
