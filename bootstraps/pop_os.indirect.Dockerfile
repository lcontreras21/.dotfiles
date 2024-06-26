# syntax=docker/dockerfile:1
FROM nycticoracs/pop_os:latest

RUN apt-get update && \
      apt-get -y install sudo python3-pip

RUN pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir ansible

RUN export PATH=$PATH:.local/bin

# Create temp user
RUN useradd -ms /bin/bash lcontreras
RUN usermod -aG sudo lcontreras

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'lcontreras:lcontreras' | chpasswd

USER lcontreras

COPY bootstrap.sh bootstrap.sh
WORKDIR /home/lcontreras

RUN ./bootstrap.sh
