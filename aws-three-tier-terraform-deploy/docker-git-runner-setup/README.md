# GitHub Self-Hosted Runner Setup

## Prerequisites

1. **GitHub Personal Access Token (PAT)**
   - Go to: https://github.com/settings/tokens
   - Click "Generate new token (classic)"
   - Required scopes:
     - `repo` (Full control of private repositories)
     - `workflow` (Update GitHub Action workflows)
     - `admin:org` (if registering for an organization)
   - Copy the token (you won't see it again!)

## Setup Instructions

### 1. Configure Environment Variables

Edit the `.env` file and replace with your actual values:

```bash
REPO=chiamaka99346/Bank-app
GITHUB_PAT=ghp_xxxxxxxxxxxxxxxxxxxx
RUNNER_NAME=aws-terraform-runner
```

### 2. Build and Start the Runner

```bash
# Build and start the container
docker-compose up -d --build

# Check if it's running
docker ps

# View logs
docker logs github-runner -f
```

### 3. Verify Registration

- Go to your GitHub repository
- Navigate to: **Settings → Actions → Runners**
- You should see your runner listed as "Idle" or "Active"

## Troubleshooting

### Runner keeps restarting
```bash
# Check logs for errors
docker logs github-runner

# Common issues:
# - Invalid GitHub PAT
# - Wrong repository name format
# - PAT doesn't have required permissions
```

### Permission denied errors
```bash
# Rebuild the container
docker-compose down
docker-compose up -d --build
```

### Remove and re-register runner
```bash
docker-compose down
docker volume rm docker-git-runner-setup_runner-work
docker-compose up -d --build
```

## What's Installed

- Ubuntu 22.04
- Docker CLI
- Terraform
- Node.js 18 LTS
- AWS CLI v2
- Git, curl, jq, unzip

## Security Notes

- Never commit the `.env` file with real credentials
- Rotate your GitHub PAT regularly
- Use least-privilege access for the PAT
- The `.env` file is already in `.gitignore`
