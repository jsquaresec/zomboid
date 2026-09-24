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
[![CyberSpace](https://img.shields.io/badge/Discord-CyberSpace-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/cBpNNssAjC)
[![Website](https://img.shields.io/badge/Web-onlythedemons.com-168BFF?style=for-the-badge&logo=googlechrome&logoColor=white)](https://onlythedemons.com)

## Certifications & Badges

### Google Cloud

#### Implement CI/CD Pipelines on Google Cloud
**Google Cloud** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/c9b68674-0dad-4e4b-9c3b-044363d42e18/public_url)

#### Develop and Secure APIs with Apigee X
**Google Cloud** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/09523777-2ae2-40fd-9ba9-1cd800e31aff/public_url)

#### Use Machine Learning APIs on Google Cloud
**Google Cloud** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/77d63d3d-424e-455f-a5b3-b5e6ab22b6c5/public_url)

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

#### Intermediate Breach & Attack
**AttackIQ** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/05dd3d4a-1997-4130-8f27-77b9b14c133b)

#### Beyond Atomic Testing with Attack Flows
**AttackIQ** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/4d1e100d-ca7d-43c1-a1b7-d621e87db7c3)

#### Intermediate Purple Teaming
**AttackIQ** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/ff5256c3-e2bc-42cb-a901-9f29d7c5e914)

#### Operationalizing MITRE ATT&CK v19
**AttackIQ** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/95934f21-c54a-4a14-9045-d325fc2e6f2f/public_url)

#### Breach & Attack Simulation
**AttackIQ** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/de4fae36-1f0a-4fad-bd2f-82c23f3fb135/public_url)

#### Foundations of Purple Teaming
**AttackIQ** • Issued September 2026  
[![Verify on Credly](https://img.shields.io/badge/Verify-Credly-168BFF?style=for-the-badge&logo=credly&logoColor=white)](https://www.credly.com/badges/7e67c167-c9f0-42a4-a97a-31d6a2de57ad/public_url)

### Hack The Box

#### Web Requests
**Hack The Box Academy** • September 2026  
Hack The Box Academy achievement covering HTTP requests, request methods, headers, parameters, responses, and practical web communication fundamentals.

[![View Achievement](https://img.shields.io/badge/View-Hack%20The%20Box%20Achievement-9FEF00?style=for-the-badge&logo=hackthebox&logoColor=111111)](https://academy.hackthebox.com/achievement/2870402/35)

#### Holmes CTF 2026 — The Reichenbach Directive
**Hack The Box** • September 2026  
Event certificate for participation in Holmes CTF 2026 with **Only The Demons**, finishing **307th of 5,637 teams**, solving **73 of 111 challenges**, and earning **5,900 points**.

[![View Certificate](https://img.shields.io/badge/View-Holmes%20CTF%202026%20Certificate-9FEF00?style=for-the-badge&logo=hackthebox&logoColor=111111)](https://jsquaresec.github.io/jsquaresec/certificates/holmes-ctf-2026/)

#### Script Kiddie
**Hack The Box** • September 2026  
Hack The Box Labs achievement earned through hands-on security labs and practical challenge completion.

[![View Achievement](https://img.shields.io/badge/View-Hack%20The%20Box%20Achievement-9FEF00?style=for-the-badge&logo=hackthebox&logoColor=111111)](https://labs.hackthebox.com/achievement/badge/3945090/214)

#### Linux Fundamentals
**Hack The Box Academy** • September 2026  
Hack The Box Academy achievement recognizing completion of Linux Fundamentals training.

[![View Achievement](https://img.shields.io/badge/View-Hack%20The%20Box%20Achievement-9FEF00?style=for-the-badge&logo=hackthebox&logoColor=111111)](https://academy.hackthebox.com/achievement/badge/62319cf4-b53a-11f1-82d1-bea50ffe6cb4)

#### That Was A SOCer
**Hack The Box** • September 2026  
Practical Hack The Box Labs achievement demonstrating hands-on security operations and investigation skills.

[![View Achievement](https://img.shields.io/badge/View-Hack%20The%20Box%20Achievement-9FEF00?style=for-the-badge&logo=hackthebox&logoColor=111111)](https://labs.hackthebox.com/achievement/badge/3945090/243)

#### Investigator In The Making
**Hack The Box** • September 2026  
Practical Hack The Box Labs achievement earned through hands-on cybersecurity investigation exercises.

[![View Achievement](https://img.shields.io/badge/View-Hack%20The%20Box%20Achievement-9FEF00?style=for-the-badge&logo=hackthebox&logoColor=111111)](https://labs.hackthebox.com/achievement/badge/3945090/242)

### TryHackMe

#### Introduction to Security Engineering
**TryHackMe** • September 2026  
TryHackMe achievement recognizing completion of the Introduction to Security Engineering learning content.

[![View Achievement](https://img.shields.io/badge/View-TryHackMe%20Achievement-212C42?style=for-the-badge&logo=tryhackme&logoColor=white)](https://tryhackme.com/jsquaresec/badges/intro-to-security-engineering?utm_campaign=social_share&utm_medium=social&utm_content=badge&utm_source=copy&sharerId=6aa58ef9208838a64756eb1a)

#### OWASP Top 10
**TryHackMe** • September 2026  
TryHackMe achievement recognizing completion of OWASP Top 10 learning content covering common web application security risks.

[![View Achievement](https://img.shields.io/badge/View-TryHackMe%20Achievement-212C42?style=for-the-badge&logo=tryhackme&logoColor=white)](https://tryhackme.com/jsquaresec/badges/owasp-10?utm_campaign=social_share&utm_medium=social&utm_content=badge&utm_source=copy&sharerId=6aa58ef9208838a64756eb1a)

#### Placed #1 in Bronze League
**TryHackMe** • September 2026  
TryHackMe competitive achievement recognizing a first-place finish in the Bronze League.

[![View Achievement](https://img.shields.io/badge/View-TryHackMe%20Achievement-212C42?style=for-the-badge&logo=tryhackme&logoColor=white)](https://tryhackme.com/jsquaresec/badges/bronze-league?utm_campaign=social_share&utm_medium=social&utm_content=badge&utm_source=copy&sharerId=6aa58ef9208838a64756eb1a)

### Harvard University / CS50

#### CS50x: Introduction to Computer Science
**Harvard University / CS50** • 2026  
Completed CS50x: Introduction to Computer Science, including ten problem sets and a final project.

[![Verify Certificate](https://img.shields.io/badge/Verify-CS50%20Certificate-A51C30?style=for-the-badge&logo=harvarduniversity&logoColor=white)](https://cs50.harvard.edu/certificates/d984aae9-4871-42c4-b9c2-9bd31bbd3e80)

### Other Credentials

#### Introduction to Cyber Security: Stay Safe Online
**The Open University / OpenLearn** • Issued September 2026  
[![Verify Credential](https://img.shields.io/badge/Verify-Credential-168BFF?style=for-the-badge&logo=openbadges&logoColor=white)](https://www.open.edu/openlearn/badges/badge.php?hash=3f3aaed522c2cc2d8d04c733dabbdee7f154f51e)
