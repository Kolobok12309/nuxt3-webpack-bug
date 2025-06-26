FROM node:22-alpine as base

RUN apk add openssh \
  && apk add git \
  && apk add python3 py3-pip \
  && apk add make \
  && apk add g++

RUN npm install -g pnpm@10.10.0

WORKDIR /app

COPY package.json .npmrc pnpm-lock.yaml ./

RUN pnpm install

COPY . .

ENTRYPOINT [ "/bin/sh" ]