FROM debian:stable-slim

COPY . ./shbaam
WORKDIR /shbaam

RUN apt-get update && \
    apt-get install -y --no-install-recommends $(grep -ve '^#' requirements.apt) && \
    rm -rf /var/lib/apt/lists/*

ADD https://bootstrap.pypa.io/get-pip.py .
RUN python get-pip.py && \
    rm get-pip.py

RUN pip install -r requirements.pip --no-cache-dir
