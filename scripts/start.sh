#!/usr/bin/env bash
set -Eeuo pipefail
cd "$(dirname "$0")/.."

if [[ ! -f .env ]]; then
  cp .env.example .env
  chmod 600 .env
  echo "Created .env. Set strong passwords in it, then run this script again."
  exit 1
fi

docker compose pull
docker compose up -d
docker compose ps
echo "Follow startup with: docker compose logs -f --tail=100"
