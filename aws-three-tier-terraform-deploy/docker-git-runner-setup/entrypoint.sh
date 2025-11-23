#!/bin/bash
set -e

echo "========================================="
echo "GitHub Actions Self-Hosted Runner Setup"
echo "========================================="
echo "Repository: ${REPO}"
echo "Runner Name: ${RUNNER_NAME}"
echo "========================================="

# Redirect all output to stdout and stderr
exec 1>&1 2>&2

cd /home/runner

echo "[1/4] Setting up permissions..."
mkdir -p /home/runner/_work
chown -R runner:runner /home/runner/_work
chown -R runner:runner /home/runner
echo "✓ Permissions configured"

# Validate environment variables
if [ -z "${REPO}" ] || [ -z "${GITHUB_PAT}" ] || [ -z "${RUNNER_NAME}" ]; then
    echo "❌ ERROR: Missing required environment variables"
    echo "   REPO: ${REPO:-NOT SET}"
    echo "   GITHUB_PAT: ${GITHUB_PAT:+SET}"
    echo "   RUNNER_NAME: ${RUNNER_NAME:-NOT SET}"
    sleep 60
    exit 1
fi

# Check if REPO contains a slash (repo-level) or not (user-level)
if [[ "${REPO}" == *"/"* ]]; then
    TOKEN_URL="https://api.github.com/repos/${REPO}/actions/runners/registration-token"
    RUNNER_URL="https://github.com/${REPO}"
else
    TOKEN_URL="https://api.github.com/users/${REPO}/actions/runners/registration-token"
    RUNNER_URL="https://github.com/${REPO}"
fi

echo "[2/4] Requesting registration token from GitHub..."
RESPONSE=$(curl -s -w "\n%{http_code}" -X POST \
  -H "Authorization: token ${GITHUB_PAT}" \
  "${TOKEN_URL}")

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" != "201" ]; then
    echo "❌ ERROR: Failed to get registration token (HTTP ${HTTP_CODE})"
    echo "Response: $BODY"
    echo "Check:"
    echo "  - GITHUB_PAT is valid and has 'repo' scope"
    echo "  - Repository name is correct: ${REPO}"
    sleep 60
    exit 1
fi

RUNNER_TOKEN=$(echo "$BODY" | jq -r .token)

if [ "$RUNNER_TOKEN" == "null" ] || [ -z "$RUNNER_TOKEN" ]; then
    echo "❌ ERROR: Token is null or empty"
    echo "Response: $BODY"
    sleep 60
    exit 1
fi

echo "✓ Registration token received"

echo "[3/4] Registering runner with GitHub..."
su - runner -c "cd /home/runner && ./config.sh --unattended \
  --url \"${RUNNER_URL}\" \
  --token \"${RUNNER_TOKEN}\" \
  --name \"${RUNNER_NAME}\" \
  --labels self-hosted,docker,terraform \
  --work _work \
  --replace"

if [ $? -eq 0 ]; then
    echo "✓ Runner registered successfully"
else
    echo "❌ ERROR: Failed to register runner"
    sleep 60
    exit 1
fi

echo "[4/4] Starting runner..."
echo "Runner is now listening for jobs from GitHub Actions"
echo "========================================="

# Run as runner user - this will block and keep container running
exec su - runner -c "cd /home/runner && ./run.sh"