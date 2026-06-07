#!/bin/sh
set -eu

# OpenHost mounts persistent storage at OPENHOST_APP_DATA_DIR.
# All degoog state (plugins, themes, engines, settings) lives here.
DATA_DIR="${OPENHOST_APP_DATA_DIR:-/data/app_data/degoog}"

mkdir -p "$DATA_DIR"
chown -R 1000:1000 "$DATA_DIR"

exec su-exec 1000:1000 \
    env \
        DEGOOG_PORT=8080 \
        DEGOOG_DATA_DIR="$DATA_DIR" \
        DEGOOG_DISTRUST_PROXY=0 \
        DEGOOG_WIZARD=false \
        PUID=1000 \
        PGID=1000 \
    bun run src/server/index.ts
