ARG BUILD_FROM

# Stage 1: Download and prepare bashio
FROM debian:bookworm-slim AS bashio
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && mkdir -p /tmp/bashio \
    && curl -L -s -o /tmp/bashio.tar.gz \
        "https://github.com/hassio-addons/bashio/archive/v0.16.2.tar.gz" \
    && tar zxf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio

# Stage 2: Final image
FROM izdevdigital/e-paper-dashboard:0.0.0

# Copy bashio from the builder stage and create symlink as root
USER root
COPY --from=bashio /tmp/bashio/lib /usr/lib/bashio
RUN ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && apt-get update \
    && apt-get install -y --no-install-recommends gosu \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy data for add-on
COPY --chmod=755 run.sh /

CMD [ "/run.sh" ]
