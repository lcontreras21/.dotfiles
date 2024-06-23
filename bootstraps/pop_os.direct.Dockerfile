# syntax=docker/dockerfile:1
FROM nycticoracs/pop_os:latest

RUN apt-get update && \
      apt-get -y install sudo ansible

RUN export PATH=$PATH:.local/bin

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
