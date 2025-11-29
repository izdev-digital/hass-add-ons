#!/bin/bash
set -e

source /usr/bin/bashio

# Get config options
CLIENT_URL=$(bashio::config 'client_url')
SUPERUSER_USERNAME=$(bashio::config 'superuser_name')
SUPERUSER_PASSWORD=$(bashio::config 'superuser_password')

# Create a wrapper script that sets environment and runs the app
cat > /tmp/start-app.sh << 'WRAPPER_EOF'
#!/bin/bash
export CLIENT_URL="$1"
export SUPERUSER_USERNAME="$2"
export SUPERUSER_PASSWORD="$3"
exec dotnet /app/EPaperDashboard.dll
WRAPPER_EOF

chmod +x /tmp/start-app.sh
chown app:app /tmp/start-app.sh

# Execute wrapper as app user, passing values as arguments
exec gosu app /tmp/start-app.sh "${CLIENT_URL}" "${SUPERUSER_USERNAME}" "${SUPERUSER_PASSWORD}"
