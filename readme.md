Degoog meta-search aggregator for Cloud in a Bottle. Queries multiple search engines simultaneously and shows unified results. Supports custom engines, plugins, themes, and transports installable from community repos.

Upstream: https://github.com/degoog-org/degoog

## How it works

Wraps the official `ghcr.io/degoog-org/degoog` image with Cloud in a Bottle conventions:

- Runs on port 8080 (Cloud in a Bottle-routed)
- Persistent data (plugins, themes, engines, settings) stored in `$OPENHOST_APP_DATA_DIR`
- Owner-only access via Cloud in a Bottle zone auth — no in-app login required
- Health check at `/readyz`

## Deploying

```bash
oh app deploy https://github.com/imbue-openhost/bottled-degoog --wait
```

The app will be available at `degoog.<zone_domain>`.

## Data

All state lives in `$OPENHOST_APP_DATA_DIR/`:
- `plugins/` — bang-command and slot plugins
- `themes/` — CSS themes
- `engines/` — custom search engine definitions
- `transports/` — custom HTTP transport strategies
- `plugin-settings.json` — per-extension settings and active theme
- `server-settings.json` — instance-level settings

## Configuration

To expose degoog publicly (allow anyone to search, settings remain owner-only), add `"/"` to `public_paths` in `openhost.toml` and set `DEGOOG_PUBLIC_INSTANCE=true` in the container env.
