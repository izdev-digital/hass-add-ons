#!/usr/bin/env bashio

# Get config options
CLIENT_URL=$(bashio::config 'client_url')
SUPERUSER_USERNAME=$(bashio::config 'superuser_name')
SUPERUSER_PASSWORD=$(bashio::config 'superuser_password')

bashio::log.info "Starting E-Paper Dashboard..."
bashio::log.info "Client URL: ${CLIENT_URL}"
bashio::log.info "Superuser Name: ${SUPERUSER_USERNAME}"

# Test that env vars will be passed (this runs as app user)
bashio::log.info "Testing environment variable passing..."
gosu app env CLIENT_URL="${CLIENT_URL}" SUPERUSER_USERNAME="${SUPERUSER_USERNAME}" bash -c 'echo "Test - CLIENT_URL in app context: $CLIENT_URL"'

# Start the application as app user with environment variables
exec gosu app \
    env CLIENT_URL="${CLIENT_URL}" \
    SUPERUSER_USERNAME="${SUPERUSER_USERNAME}" \
    SUPERUSER_PASSWORD="${SUPERUSER_PASSWORD}" \
    dotnet /app/EPaperDashboard.dll
