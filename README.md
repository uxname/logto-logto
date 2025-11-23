# Logto Production Deployment

This repository contains the configuration for running a self-hosted Logto instance using Docker Compose.

## Prerequisites

- Docker Engine
- Docker Compose
- A reverse proxy (Nginx, Caddy, or Traefik) configured with SSL/TLS certificates.

## Installation

1. **Prepare Environment Variables**

   Copy the example configuration file:
   ```bash
   cp .env.example .env
   ```

2. **Configure Settings**

   Edit the `.env` file:
    - Change `POSTGRES_PASSWORD` to a strong secret.
    - Update `DB_URL` to match the new password.
    - Set `ENDPOINT` to your public Logto URL (e.g., `https://auth.yourdomain.com`).
    - Set `ADMIN_ENDPOINT` to your public Admin Console URL (e.g., `https://admin.yourdomain.com`).

3. **Start Services**

   Launch the containers in detached mode:
   ```bash
   docker compose up -d
   ```

## Database Persistence

The PostgreSQL database files are stored locally in the `./data/postgres` directory relative to the `docker-compose.yml`
file.

**Note on Permissions:**
If running on Linux, ensure the `./data/postgres` directory allows the container user to write data. The official
Postgres Alpine image typically runs as UID 70 or 999. You may need to adjust ownership if the container fails to start:

```bash
mkdir -p ./data/postgres
sudo chown -R 70:70 ./data/postgres
```

## Reverse Proxy Configuration

For production use, do not expose ports 3001/3002 directly to the internet. Use a reverse proxy to handle SSL
termination and forward traffic:

- Forward `https://auth.yourdomain.com` -> `127.0.0.1:3001`
- Forward `https://admin.yourdomain.com` -> `127.0.0.1:3002`

Ensure your reverse proxy sets the `X-Forwarded-Proto: https` header.

## Upgrading

To upgrade to the latest version of Logto:

```bash
docker compose pull
docker compose up -d
```