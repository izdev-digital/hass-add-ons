#!/usr/bin/with-contenv bashio

# Get config options
export CLIENT_URL=$(bashio::config 'client_url')
export SUPERUSER_USERNAME=$(bashio::config 'superuser_name')
export SUPERUSER_PASSWORD=$(bashio::config 'superuser_password')

bashio::log.info "Starting E-Paper Dashboard..."
bashio::log.info "Client URL: ${CLIENT_URL}"

# Start the application as app user with environment variables
exec su-exec app env \
    CLIENT_URL="${CLIENT_URL}" \
    SUPERUSER_USERNAME="${SUPERUSER_USERNAME}" \
    SUPERUSER_PASSWORD="${SUPERUSER_PASSWORD}" \
    dotnet /app/EPaperDashboard.dll
