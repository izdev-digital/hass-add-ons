#!/usr/bin/with-contenv bashio

# Get config options
export CLIENT_URL=$(bashio::config 'client_url')
export SUPERUSER_USERNAME=$(bashio::config 'superuser_name')
export SUPERUSER_PASSWORD=$(bashio::config 'superuser_password')

bashio::log.info "Starting E-Paper Dashboard..."
bashio::log.info "Client URL: ${CLIENT_URL}"

# Start the application
exec dotnet /app/EPaperDashboard.dll
