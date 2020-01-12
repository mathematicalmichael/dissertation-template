#FROM python:3.7-slim
FROM quay.io/fenicsproject/stable:current
USER root
RUN apt-get update && \
    apt-get install -y \
    tree \
    git \
    ;

RUN apt-get clean && \
    rm -rf /tmp/
    
# bet
WORKDIR /tmp
RUN cd /tmp && \
    git clone --single-branch --branch sample https://github.com/mathematicalmichael/BET.git --depth=1 && \
    cd BET && \
    pip install .

RUN pip install \
    pyprind  \
    autopep8 \
    black \
    ;

# parallelism
RUN apt-get install -y \
    gfortran \
    libblas-dev \
    liblapack-dev \
    mpich \
    libmpich-dev

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
        && apt-get autoremove -y
