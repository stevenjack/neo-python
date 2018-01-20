FROM ubuntu:16.04
LABEL maintainer="hal0x2328"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    apt-utils \
    wget python \
    ca-certificates apt-transport-https \
    libleveldb-dev sqlite3 libsqlite3-dev \
    python3.5-dev python3-pip libssl-dev

RUN rm -rf /var/lib/apt/lists/*

ADD . /opt/neo-python
WORKDIR /opt/neo-python

RUN pip3 install -r /opt/neo-python/requirements.txt
RUN chmod u+x /opt/neo-python/scripts/claim_neo_and_gas.py

ENTRYPOINT ["python3.5"]
