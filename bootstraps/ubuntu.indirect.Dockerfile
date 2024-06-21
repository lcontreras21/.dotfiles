# syntax=docker/dockerfile:1
FROM ubuntu:noble

RUN apt-get update && \
      apt install -y software-properties-common && \
      add-apt-repository -y --update ppa:ansible/ansible && \ 
      apt install -y python3-pip git-all sudo wget

RUN export PATH=$PATH:.local/bin

# Create temp user
RUN useradd -ms /bin/bash lcontreras21
RUN usermod -aG sudo lcontreras21

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'lcontreras21:lcontreras21' | chpasswd

USER lcontreras21

WORKDIR /home/lcontreras21/

COPY bootstrap.sh bootstrap.sh

RUN ./bootstrap.sh

# FOR DEBUGGING:
# COPY . /home/lcontreras21/.dotfiles_test
# WORKDIR  /home/lcontreras21/.dotfiles_test

# RUN ./install
