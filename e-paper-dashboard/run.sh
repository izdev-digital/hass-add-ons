#!/bin/bash
set -e

## Read configuration directly from Home Assistant options JSON to avoid bashio dependency
OPTIONS_FILE="/data/options.json"
CLIENT_URL=$(jq -r '.CLIENT_URL // empty' "$OPTIONS_FILE")
SUPERUSER_USERNAME=$(jq -r '.SUPERUSER_USERNAME // empty' "$OPTIONS_FILE")
SUPERUSER_PASSWORD=$(jq -r '.SUPERUSER_PASSWORD // empty' "$OPTIONS_FILE")
STATE_SIGNING_KEY=$(jq -r '.STATE_SIGNING_KEY // empty' "$OPTIONS_FILE")

# Validate configuration
if [ -z "${CLIENT_URL}" ]; then
    bashio::log.error "CLIENT_URL is not configured. Please set it in the add-on configuration."
    exit 1
fi

# Create directories for persistent volumes if they don't exist
mkdir -p /data/dataprotection

# Create symlinks to persistent volumes
mkdir -p /home/app/.aspnet
ln -sf /data/dataprotection /home/app/.aspnet/DataProtection-Keys

chown -R app:app /data/dataprotection

# Start as app user with working directory set to /app
cd /app
exec gosu app dotnet /app/EPaperDashboard.dll
