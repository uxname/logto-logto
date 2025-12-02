# Logto Local Dev Environment

## Quick Start

1. **Setup Environment**
   Create the configuration file:
   ```bash
   cp .env.example .env
   ```

2. **Prepare Script**
   Make the initialization script executable:
   ```bash
   chmod +x init.sh
   ```

3. **Start Services**
   Run the stack in detached mode:
   ```bash
   docker compose up -d
   ```

## Access Points

| Service           | URL / Port                                     | Description           |
|-------------------|------------------------------------------------|-----------------------|
| **Admin Console** | [http://localhost:3002](http://localhost:3002) | Management UI         |
| **Core API**      | [http://localhost:3001](http://localhost:3001) | OIDC Provider         |
| **PostgreSQL**    | `localhost:5432`                               | Credentials in `.env` |

## Common Commands

* **View Logs:** `docker compose logs -f app`
* **Stop & Remove:** `docker compose down`
* **Rebuild:** `docker compose up -d --build`
