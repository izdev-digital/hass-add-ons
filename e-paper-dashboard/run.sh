#!/bin/bash
set -e

source /usr/bin/bashio

# Get config options
CLIENT_URL=$(bashio::config 'client_url')
SUPERUSER_USERNAME=$(bashio::config 'superuser_name')
SUPERUSER_PASSWORD=$(bashio::config 'superuser_password')

# Create environment file for app user
ENV_FILE="/tmp/app.env"
cat > "$ENV_FILE" << EOF
export CLIENT_URL="${CLIENT_URL}"
export SUPERUSER_USERNAME="${SUPERUSER_USERNAME}"
export SUPERUSER_PASSWORD="${SUPERUSER_PASSWORD}"
EOF

chown app:app "$ENV_FILE"
chmod 600 "$ENV_FILE"

# Start the application as app user
exec gosu app bash -c "source $ENV_FILE && exec dotnet /app/EPaperDashboard.dll"
