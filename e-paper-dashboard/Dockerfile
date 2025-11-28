ARG BUILD_FROM
FROM izdevdigital/e-paper-dashboard:0.0.0

# Install bashio for Home Assistant add-on integration
RUN apt-get update && apt-get install -y --no-install-recommends \
    jq \
    curl \
    && curl -J -L -o /tmp/bashio.tar.gz \
    "https://github.com/hassio-addons/bashio/archive/v0.16.2.tar.gz" \
    && mkdir /tmp/bashio \
    && tar zxvf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && rm -rf /tmp/bashio /tmp/bashio.tar.gz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy data for add-on
COPY --chmod=755 run.sh /

CMD [ "/run.sh" ]
