FROM codercom/code-server:4.96.4

USER root
RUN apt-get update \
    && apt-get install -y curl \
    && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables for security headers and CORS
ENV DISABLE_TELEMETRY=true
ENV CS_DISABLE_FILE_DOWNLOADS=false
ENV CS_DISABLE_GETTING_STARTED_OVERRIDE=1
ENV CS_DISABLE_PROXY_SECURITY=true
ENV CS_ALLOW_HTTP=true
ENV CS_DISABLE_FRAME_OPTIONS=true
ENV NODE_TLS_REJECT_UNAUTHORIZED=0
ENV CS_CORS=true
ENV CS_CORS_ORIGIN="*"

# Expose code-server's default port
EXPOSE 8080

# Start code-server on container launch
CMD ["code-server", "--auth", "none", "--bind-addr", "0.0.0.0:8080", "--disable-workspace-trust"]
