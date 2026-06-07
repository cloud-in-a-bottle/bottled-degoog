FROM ghcr.io/degoog-org/degoog:latest

# Install tini for proper PID 1 signal handling / zombie reaping
USER root
RUN apk add --no-cache tini

COPY start.sh /opt/openhost-degoog/start.sh
RUN chmod 0755 /opt/openhost-degoog/start.sh

# OpenHost routes to this port
EXPOSE 8080

ENTRYPOINT ["/sbin/tini", "--", "/opt/openhost-degoog/start.sh"]
