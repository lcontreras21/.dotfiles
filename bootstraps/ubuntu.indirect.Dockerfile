# syntax=docker/dockerfile:1
FROM ubuntu:noble

RUN apt-get update && \
      apt install -y software-properties-common && \
      add-apt-repository -y --update ppa:ansible/ansible && \ 
      apt install -y python3-pip git-all sudo wget

RUN export PATH=$PATH:.local/bin

# Create temp user
RUN useradd -ms /bin/bash lcontreras
RUN usermod -aG sudo lcontreras

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'lcontreras:lcontreras' | chpasswd

USER lcontreras

WORKDIR /home/lcontreras/

COPY bootstrap.sh bootstrap.sh

RUN ./bootstrap.sh

# FOR DEBUGGING:
# COPY . /home/lcontreras/.dotfiles
# WORKDIR  /home/lcontreras/.dotfiles

# RUN ./install
