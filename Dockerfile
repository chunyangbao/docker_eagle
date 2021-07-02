# Using OpenJDK 8
# This Dockerfile does not require any files that are in the GATK4 repo.
FROM ubuntu:18.04

#### Basic image utilities
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    wget \
    build-essential \
    software-properties-common && \
    apt-get -y clean  && \
    apt-get -y autoclean  && \
    apt-get -y autoremove

#### Install Eagle
RUN wget --no-check-certificate https://storage.googleapis.com/broad-alkesgroup-public/Eagle/downloads/Eagle_v2.4.1.tar.gz && \
    tar -xf Eagle_v2.4.1.tar.gz && \
    mv Eagle_v2.4.1 eagle && \
    rm -f Eagle_v2.4.1.tar.gz

WORKDIR /eagle
ENV PATH /eagle:$PATH

CMD ["bash"]
