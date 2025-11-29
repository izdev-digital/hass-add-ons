#!/bin/bash
set -e

source /usr/bin/bashio

# Get config options
CLIENT_URL=$(bashio::config 'client_url')
SUPERUSER_USERNAME=$(bashio::config 'superuser_name')
SUPERUSER_PASSWORD=$(bashio::config 'superuser_password')

# Create config directory if it doesn't exist
mkdir -p /app/config

# Write configuration to environment.json
cat > /app/config/environment.json << EOF
{
  "CLIENT_URL": "${CLIENT_URL}",
  "SUPERUSER_USERNAME": "${SUPERUSER_USERNAME}",
  "SUPERUSER_PASSWORD": "${SUPERUSER_PASSWORD}"
}
EOF

chown app:app /app/config/environment.json
chmod 600 /app/config/environment.json

# Start as app user
exec gosu app dotnet /app/EPaperDashboard.dll
