<div align="center">

<img src="https://raw.githubusercontent.com/jsquaresec/jsquaresec/main/assets/j2sec-banner.svg" alt="J2SEC banner" width="100%" />

<br>

<img src="https://raw.githubusercontent.com/jsquaresec/jsquaresec/main/assets/j2sec-logo.svg" alt="J2SEC logo" width="110" />

</div>

# Project Zomboid VPS Server

Docker deployment for a Project Zomboid dedicated server on Ubuntu, tuned for **4 vCPU / 8 GB RAM**.

## VPS deployment

```bash
git clone https://github.com/jsquaresec/zomboid.git
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

## Links

[![GitHub](https://img.shields.io/badge/GitHub-jsquaresec-111111?style=for-the-badge&logo=github&logoColor=white)](https://github.com/jsquaresec)
[![X](https://img.shields.io/badge/X-@j2__sec-111111?style=for-the-badge&logo=x&logoColor=white)](https://x.com/j2_sec?s=11)
[![OTD Studios](https://img.shields.io/badge/Discord-OTD%20Studios-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/nz5jE7PVh7)
[![Evolution Gaming](https://img.shields.io/badge/Discord-Evolution%20Gaming-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/rjf9ZYMARN)
[![Website](https://img.shields.io/badge/Web-onlythedemons.com-168BFF?style=for-the-badge&logo=googlechrome&logoColor=white)](https://onlythedemons.com)
