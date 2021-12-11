FROM node:16-alpine3.14

RUN apk add curl git python2 gcc g++ make openssh

USER node

RUN mkdir /home/node/.ssh && chmod 700 /home/node/.ssh

