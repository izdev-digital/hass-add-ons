#!/usr/bin/env bashio

# Get config options
export CLIENT_URL=$(bashio::config 'client_url')
export SUPERUSER_USERNAME=$(bashio::config 'superuser_name')
export SUPERUSER_PASSWORD=$(bashio::config 'superuser_password')

bashio::log.info "Starting E-Paper Dashboard..."
bashio::log.info "Client URL: ${CLIENT_URL}"
bashio::log.info "Superuser Name: ${SUPERUSER_USERNAME}"

# Start the application as app user (environment variables are inherited)
exec gosu app dotnet /app/EPaperDashboard.dll
