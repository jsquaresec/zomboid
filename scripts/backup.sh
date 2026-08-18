#!/usr/bin/env bash
set -Eeuo pipefail
cd "$(dirname "$0")/.."

mkdir -p backups
stamp=$(date -u +%Y%m%dT%H%M%SZ)
docker run --rm \
  -v zomboid-data:/source:ro \
  -v "$(pwd)/backups:/backups" \
  alpine:3.22 tar -czf "/backups/zomboid-data-${stamp}.tar.gz" -C /source .

find backups -type f -name 'zomboid-data-*.tar.gz' -mtime +14 -delete
echo "Backup created: backups/zomboid-data-${stamp}.tar.gz"
