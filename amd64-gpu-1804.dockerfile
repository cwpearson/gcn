FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

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

# install GCN, then remove tensorflow and install gpu tensorflow
RUN python3 setup.py install \
    && python3 -m pip uninstall -y tensorflow \
    && python3 -m pip install tensorflow-gpu==1.13.1

