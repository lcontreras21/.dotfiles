# syntax=docker/dockerfile:1
FROM ubuntu:noble

RUN apt-get update && \
      apt install -y software-properties-common && \
      add-apt-repository -y --update ppa:ansible/ansible && \ 
      apt install -y ansible git-all sudo wget

# Create temp user
RUN useradd -ms /bin/bash lcontreras
RUN usermod -aG sudo lcontreras

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'lcontreras:lcontreras' | chpasswd

COPY . /home/lcontreras/.dotfiles
WORKDIR /home/lcontreras/.dotfiles

RUN chown -R lcontreras:lcontreras /home/lcontreras/.dotfiles

USER lcontreras

RUN ansible-galaxy install -r bootstraps/requirements.yml

ENV XDG_CONFIG_HOME=/home/lcontreras/.config

# Bootstrap environment for newuser
RUN ansible-playbook bootstraps/bootstrap.yml --extra-vars "ansible_sudo_pass=lcontreras"
