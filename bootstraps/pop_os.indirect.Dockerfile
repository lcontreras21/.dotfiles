# syntax=docker/dockerfile:1
FROM nycticoracs/pop_os:latest

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

RUN ./bootstrap.sh
