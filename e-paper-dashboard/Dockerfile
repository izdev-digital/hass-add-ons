# Home Assistant Addon Dockerfile
# This wraps the base izBoard image and adapts it for HA addon usage

ARG BUILD_FROM=izdevdigital/e-paper-dashboard:latest
FROM ${BUILD_FROM}

# Define build arguments after FROM
ARG BUILD_VERSION=latest

# Switch back to root user for HA addon compatibility
# HA Supervisor mounts /data at runtime with root ownership
USER root

# Ensure /data directory exists and has correct permissions
# Note: The actual /data volume will be mounted by HA Supervisor at runtime
# Playwright browsers are already in user-agnostic /.cache/ms-playwright from base image
RUN mkdir -p /data/DataProtection-Keys && \
    chmod -R 755 /data

# Add healthcheck for HA Supervisor monitoring
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8128/ || exit 1

# Labels for Home Assistant addon
LABEL \
    io.hass.name="izBoard" \
    io.hass.description="E-Paper Dashboard for Home Assistant" \
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}"

# Expose port for ingress (must match config.json ingress_port)
EXPOSE 8128

# Explicitly set CMD to run .NET app directly, bypassing any s6-overlay
CMD ["dotnet", "/app/EPaperDashboard.dll"]
