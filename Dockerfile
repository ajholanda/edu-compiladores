FROM debian:latest
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends build-essential bison flex git vim \
  && rm -rf /var/lib/apt/lists/*

COPY bison /home/bison
COPY flex /home/flex
VOLUME /home
WORKDIR /home