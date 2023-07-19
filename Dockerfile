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
