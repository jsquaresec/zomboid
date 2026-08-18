# Project Zomboid VPS Server

Docker deployment for a Project Zomboid dedicated server on Ubuntu, tuned for **4 vCPU / 8 GB RAM**.

## VPS deployment

```bash
git clone https://github.com/MayheM-Sec/zomboid.git
cd zomboid
chmod +x scripts/*.sh
sudo ./scripts/install.sh
cp .env.example .env
nano .env
./scripts/start.sh
```

Set strong `SERVER_PASSWORD` and `ADMIN_PASSWORD` values in `.env`. The server uses the stable branch by default, 5 GB of Java memory, up to 16 players, autosaves every 15 minutes, and automatic container recovery.

The first launch downloads the dedicated server and may take several minutes. Watch it with:

```bash
docker compose logs -f --tail=100
```

When initialization completes, connect to `YOUR_VPS_IP:16261`. In addition to UFW, allow UDP ports **16261** and **16262** in the OVH/provider firewall.

## Common operations

```bash
docker compose ps                    # Status
docker compose logs -f --tail=100    # Logs
docker compose restart               # Restart
docker compose down                  # Stop safely
./scripts/update.sh                   # Pull repo/image updates
./scripts/backup.sh                   # Save-volume backup
```

## Mods

Add semicolon-separated Steam Workshop IDs to `MOD_IDS` and their matching in-game Mod IDs to `MOD_NAMES` in `.env`, then run `docker compose up -d`.

## Build 42

The default is the stable branch. To test Build 42, set `BETA_BRANCH=unstable` in `.env`, then run `./scripts/update.sh`. Back up the world first and ensure every player uses the same game branch.

## Security and persistence

- `.env` is ignored by Git, so passwords stay on the VPS.
- RCON is disabled and not exposed by default.
- World/configuration and server installation data live in named Docker volumes.
- The image retains 12 internal backups at two-hour intervals; `scripts/backup.sh` creates an additional portable archive and removes archives older than 14 days.

To inspect the volumes:

```bash
docker volume ls | grep zomboid
```
