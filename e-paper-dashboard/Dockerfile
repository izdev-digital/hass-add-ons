ARG BUILD_FROM

FROM debian:bookworm-slim AS bashio
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && mkdir -p /tmp/bashio \
    && curl -L -s -o /tmp/bashio.tar.gz \
        "https://github.com/hassio-addons/bashio/archive/v0.16.2.tar.gz" \
    && tar zxf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio

FROM izdevdigital/e-paper-dashboard:latest

USER root
COPY --from=bashio /tmp/bashio/lib /usr/lib/bashio
RUN ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && apt-get update \
    && apt-get install -y --no-install-recommends gosu jq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --chmod=755 run.sh /

ENTRYPOINT ["/run.sh"]
