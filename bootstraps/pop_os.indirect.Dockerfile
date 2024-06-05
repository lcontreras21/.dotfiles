# syntax=docker/dockerfile:1
FROM nycticoracs/pop_os:latest

RUN apt-get update && \
      apt-get -y install sudo python3-pip

RUN pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir ansible

RUN export PATH=$PATH:.local/bin

# Create temp user
RUN useradd -ms /bin/bash lcontreras21
RUN usermod -aG sudo lcontreras21

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'lcontreras21:lcontreras21' | chpasswd

USER lcontreras21

COPY download.sh download.sh
COPY install install
WORKDIR .

RUN ./download.sh

