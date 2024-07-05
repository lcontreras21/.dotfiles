# syntax=docker/dockerfile:1
# Images:
#   - ubuntu:noble
#   - nycticoracs/pop_os:latest 

ARG IMAGE=ubuntu:noble
FROM ${IMAGE}

RUN apt-get update && \
      apt-get -y install sudo python3-pip git-all wget

# Create temp user
RUN useradd -ms /bin/bash lcontreras
RUN usermod -aG sudo lcontreras

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'lcontreras:lcontreras' | chpasswd

USER lcontreras

WORKDIR /home/lcontreras
COPY bootstrap.sh bootstrap.sh

ENV XDG_CONFIG_HOME=/home/lcontreras/.config

RUN ./bootstrap.sh "debug"
