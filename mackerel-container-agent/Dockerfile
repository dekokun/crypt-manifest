FROM mackerel/mackerel-container-agent:v0.5.1-plugins@sha256:12c13395ab8df09e15d19a38a685901e552d8d612172f3411d59b48aabb75872

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    jq \
    curl \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*
RUN curl -o bitcoin.tar.gz https://bitcoin.org/bin/bitcoin-core-22.0/bitcoin-22.0-aarch64-linux-gnu.tar.gz \
 && tar xvf bitcoin.tar.gz \
 && install -m 0755 -o root -g root -t /usr/bin bitcoin-22.0/bin/bitcoin-cli \
 && rm -rf bitcoin-22.0/

COPY mackerel.yaml /etc/mackerel/mackerel.yaml
COPY mackerel-agent-bitcoin /usr/local/bin/mackerel-agent-bitcoin
RUN chmod 755 /usr/local/bin/mackerel-agent-bitcoin

ENTRYPOINT ["/usr/local/bin/mackerel-container-agent"]
