FROM ubuntu:16.04
LABEL maintainer="hal0x2328"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    libleveldb-dev \
    python3.5-dev python3-pip libssl-dev

RUN rm -rf /var/lib/apt/lists/*

ADD . /opt/neo-python
ADD ./scripts/claim_neo_and_gas.py /opt/neo-python/claim_neo_and_gas.py
WORKDIR /opt/neo-python

RUN pip3 install -r /opt/neo-python/requirements.txt
RUN chmod u+x /opt/neo-python/claim_neo_and_gas.py

#ENTRYPOINT ["python3.5"]
