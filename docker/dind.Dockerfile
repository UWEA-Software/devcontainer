FROM docker:dind

#--------------------------------------------------------------------------
# Dependencies
#--------------------------------------------------------------------------

RUN apk add curl git make shadow openssh docker-compose

#--------------------------------------------------------------------------
# User & Group setup
#--------------------------------------------------------------------------

RUN groupadd --gid 1000 developer \
    && groupadd --gid 1001 docker \
    && useradd --uid 1000 --gid developer --shell /bin/sh --create-home developer \
    && usermod -a -G docker developer


USER developer

RUN mkdir -m 700 /home/developer/.ssh
