<div align="center">

<img src="https://raw.githubusercontent.com/jsquaresec/jsquaresec/main/assets/j2sec-approved-banner.webp" alt="J2SEC approved banner" width="100%" />

<br>

<img src="https://raw.githubusercontent.com/jsquaresec/jsquaresec/main/assets/j2sec-approved-profile.webp" alt="J2SEC approved profile artwork" width="480" />

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
[![Certifications](https://img.shields.io/badge/Verified-Credentials-168BFF?style=for-the-badge&logo=googlechrome&logoColor=white)](https://jsquaresec.github.io/jsquaresec/certifications/)
[![X](https://img.shields.io/badge/X-@j2__sec-111111?style=for-the-badge&logo=x&logoColor=white)](https://x.com/j2_sec?s=11)
[![OTD Studios](https://img.shields.io/badge/Discord-OTD%20Studios-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/nz5jE7PVh7)
[![Evolution Gaming](https://img.shields.io/badge/Discord-Evolution%20Gaming-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/rjf9ZYMARN)
[![Website](https://img.shields.io/badge/Web-onlythedemons.com-168BFF?style=for-the-badge&logo=googlechrome&logoColor=white)](https://onlythedemons.com)

## Certifications & Badges

### Google Cloud

#### Build Infrastructure with Terraform on Google Cloud
**Google Cloud** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/02751b0c-9c07-4a42-91e8-6a54c3a0192b/public_url)

#### Implement DevOps Workflows in Google Cloud
**Google Cloud** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/0f9979bc-d59f-4d16-a80b-356838a44834/public_url)

#### Build a Secure Google Cloud Network
**Google Cloud** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/087862e0-45ad-40e5-acab-1af9485822d5/public_url)

#### Implement Cloud Security Fundamentals on Google Cloud
**Google Cloud** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/3a3a7799-7310-4c39-9ff6-879ae89dd610/public_url)

### Amazon Web Services (AWS)

#### AWS Application Networking Demonstrated
**Amazon Web Services (AWS)** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/46477737-7d9e-41e7-b23b-76c5a598169e/public_url)

#### AWS Incident Response Demonstrated
**Amazon Web Services (AWS)** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/fcfbca6c-7cc7-4de2-9704-a1bdf9d7ed4b/public_url)

### Cisco

#### Ethical Hacking
**Cisco** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/cc6f57d0-015b-40d1-ad02-2afb4c1a37ac/public_url)

#### Cisco Networking
**Cisco** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/5f247425-d38a-4497-bbb6-126668af27fc/public_url)

#### Python Coding 1
**Cisco** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/6b3e909b-45d8-44f4-8a31-c878bcbd7495/public_url)

#### Python Coding 2
**Cisco** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/5c1f2234-ae0a-45de-af49-677dce570e23/public_url)

### AttackIQ

#### Breach & Attack Simulation
**AttackIQ** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/de4fae36-1f0a-4fad-bd2f-82c23f3fb135/public_url)

#### Foundations of Purple Teaming
**AttackIQ** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/7e67c167-c9f0-42a4-a97a-31d6a2de57ad/public_url)

### Hack The Box

#### That Was A SOCer
**Hack The Box** • September 2026  
[![View Achievement](https://img.shields.io/badge/View-Hack%20The%20Box%20Achievement-9FEF00?style=for-the-badge&logo=hackthebox&logoColor=111111)](https://labs.hackthebox.com/achievement/badge/3945090/243)

#### Investigator In The Making
**Hack The Box** • September 2026  
[![View Achievement](https://img.shields.io/badge/View-Hack%20The%20Box%20Achievement-9FEF00?style=for-the-badge&logo=hackthebox&logoColor=111111)](https://labs.hackthebox.com/achievement/badge/3945090/242)

### Other Credentials

#### Introduction to Cyber Security: Stay Safe Online
**The Open University / OpenLearn** • Issued September 2026  
[![Verify Credential](https://img.shields.io/badge/Verify-Credential-168BFF?style=for-the-badge&logo=openbadges&logoColor=white)](https://www.open.edu/openlearn/badges/badge.php?hash=3f3aaed522c2cc2d8d04c733dabbdee7f154f51e)
