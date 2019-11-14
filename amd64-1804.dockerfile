#FROM nvidia/cuda-ppc64le:10.1-cudnn7-devel-ubuntu18.04
# ubuntu 18.04
FROM phusion/baseimage:0.11

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV DEBIAN_FRONTEND noninteractive

# python3:            python
# python3-dev:        python development library for wrapt
# python3-pip:        pip
# python3-setuptools: for setup.py
RUN apt-get update && apt-get install -y --no-install-suggests --no-install-recommends \
      python3 \
      python3-dev \
      python3-pip \
      python3-setuptools \
    && rm -rf rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY . .

RUN python3 setup.py install
