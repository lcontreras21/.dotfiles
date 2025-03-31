# syntax=docker/dockerfile:1
# Images:
#   - ubuntu:noble
#   - nycticoracs/pop_os:latest 

ARG IMAGE=ubuntu:noble
FROM ${IMAGE}

RUN apt-get update && \
      apt install -y git-all sudo wget zsh

# Create temp user
RUN useradd -ms /bin/bash lcontreras
RUN usermod -aG sudo lcontreras

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'lcontreras:lcontreras' | chpasswd
ENV SUDO_ASKPASS=./docker/test_pass.sh

COPY . /home/lcontreras/.dotfiles
WORKDIR /home/lcontreras/.dotfiles

RUN chown -R lcontreras:lcontreras /home/lcontreras/.dotfiles

USER lcontreras
ENV USER=lcontreras

# Bootstrap environment for newuser
RUN ./install.sh --dry
