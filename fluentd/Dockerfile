FROM ruby:3.2-slim
LABEL maintainer "Fluentd developers <fluentd@googlegroups.com>"

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
            ca-certificates tini libjemalloc2 \
            make gcc g++ libc-dev wget bzip2 gnupg dirmngr libffi-dev zlib1g-dev libyaml-dev \
 && rm -rf /var/lib/apt/lists/*

RUN gem install oj -v 3.16.11 --no-document \
 && gem install rexml -v 3.3.9 --no-document \
 && gem install fluentd -v 1.16.5 --no-document \
 && gem install fluent-plugin-grok-parser --no-document \
 && gem install elasticsearch -v 7.17.11 --no-document \
 && gem install fluent-plugin-elasticsearch -v 5.4.3 --no-document

RUN groupadd -r fluent && useradd -r -g fluent fluent \
    && mkdir -p /fluentd/log /fluentd/etc /fluentd/plugins \
    && chown -R fluent:fluent /fluentd

COPY fluent.conf /fluentd/etc/
COPY entrypoint.sh /bin/
RUN chmod +x /bin/entrypoint.sh

ENV LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libjemalloc.so.2"
ENV FLUENTD_CONF="fluent.conf"

EXPOSE 24224 5140

USER fluent
ENTRYPOINT ["tini", "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]
