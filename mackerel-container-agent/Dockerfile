FROM mackerel/mackerel-container-agent:v0.5.1

RUN apt-get update -yq \
   && apt-get install -yq --no-install-recommends \
   jq \
   curl \
   gnupg2 \
   && apt-get -y clean \
   && rm -rf /var/lib/apt/lists

RUN echo "deb [arch=amd64,arm64] http://apt.mackerel.io/v2/ mackerel contrib" > /etc/apt/sources.list.d/mackerel.list
RUN curl -LfsS https://mackerel.io/file/cert/GPG-KEY-mackerel-v2 | apt-key add -

RUN apt-get update -yq && \
   apt-get install -yq --no-install-recommends mkr && \
   rm -rf /var/lib/apt/lists
RUN mkr plugin install dekokun/mackerel-plugin-bitcoin-core

ENV PATH $PATH:/opt/mackerel-agent/plugins/bin

ENTRYPOINT ["/usr/local/bin/mackerel-container-agent"]
