# Basic Details Website (Docker + Docker Compose)

This repo contains a small static site that displays basic details (name, email, skills). The site is packaged in an nginx Docker image and run using docker-compose.

## Files
- `app/index.html` — static site 
- `Dockerfile` — builds an nginx image copying the `app/` folder
- `docker-compose.yml` — runs the container and maps port 80

## Run locally
```bash
docker compose up --build -d
# then open http://localhost/ in your browser
