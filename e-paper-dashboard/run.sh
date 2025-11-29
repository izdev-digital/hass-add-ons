#!/bin/bash
set -e

## Read configuration directly from Home Assistant options JSON to avoid bashio dependency
OPTIONS_FILE="/data/options.json"
if [ -f "$OPTIONS_FILE" ]; then
  CLIENT_URL=$(jq -r '.client_url // empty' "$OPTIONS_FILE")
  SUPERUSER_USERNAME=$(jq -r '.superuser_name // empty' "$OPTIONS_FILE")
  SUPERUSER_PASSWORD=$(jq -r '.superuser_password // empty' "$OPTIONS_FILE")
else
  # Fallback to empty values
  CLIENT_URL=""
  SUPERUSER_USERNAME=""
  SUPERUSER_PASSWORD=""
fi

# Validate configuration
if [ -z "${CLIENT_URL}" ]; then
    bashio::log.error "CLIENT_URL is not configured. Please set it in the add-on configuration."
    exit 1
fi

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

chown -R app:app /app/config
chmod 644 /app/config/environment.json

# Start as app user with working directory set to /app
cd /app
exec gosu app dotnet /app/EPaperDashboard.dll
