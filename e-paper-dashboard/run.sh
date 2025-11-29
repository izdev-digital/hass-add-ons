#!/usr/bin/env bashio

# Get config options
export CLIENT_URL=$(bashio::config 'client_url')
export SUPERUSER_USERNAME=$(bashio::config 'superuser_name')
export SUPERUSER_PASSWORD=$(bashio::config 'superuser_password')

bashio::log.info "Starting E-Paper Dashboard..."
bashio::log.info "Client URL: ${CLIENT_URL}"
bashio::log.info "Superuser Name: ${SUPERUSER_USERNAME}"

# Test if variables are visible
bashio::log.info "Testing variable visibility..."
gosu app bash -c 'echo "CLIENT_URL inside app user: $CLIENT_URL"'

# Start the application as app user with explicit environment passing
exec gosu app bash -c "CLIENT_URL='${CLIENT_URL}' SUPERUSER_USERNAME='${SUPERUSER_USERNAME}' SUPERUSER_PASSWORD='${SUPERUSER_PASSWORD}' exec dotnet /app/EPaperDashboard.dll"
