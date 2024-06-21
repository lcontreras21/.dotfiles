# syntax=docker/dockerfile:1
FROM ubuntu:noble

RUN apt-get update && \
      apt install -y software-properties-common && \
      add-apt-repository -y --update ppa:ansible/ansible && \ 
      apt install -y ansible git-all sudo wget

# Create temp user
RUN useradd -ms /bin/bash lcontreras21
RUN usermod -aG sudo lcontreras21

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'lcontreras21:lcontreras21' | chpasswd

USER lcontreras21

COPY . /home/lcontreras21/.dotfiles
WORKDIR /home/lcontreras21/.dotfiles


RUN ansible-galaxy install -r bootstraps/requirements.yml

# Bootstrap environment for newuser
RUN ansible-playbook bootstraps/bootstrap.yml --extra-vars "ansible_sudo_pass=lcontreras21"
