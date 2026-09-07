#!/bin/bash

echo "📊 DEPLOYMENT STATUS DASHBOARD"
echo "=============================="
echo ""

# Get latest deployments from GitHub API
REPO="GulzarCore/java-ci-cd-demo"
TOKEN=$GITHUB_TOKEN

echo "🔍 Latest 5 deployments:"
echo ""

curl -s -H "Authorization: token $TOKEN" \
  "https://api.github.com/repos/$REPO/deployments?environment=production&per_page=5" | \
  jq -r '.[] | "• \(.id) - \(.created_at) - \(.ref)"'

echo ""
echo "🐳 Current containers:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo ""
echo "📈 Build history:"
curl -s -H "Authorization: token $TOKEN" \
  "https://api.github.com/repos/$REPO/actions/runs?per_page=5" | \
  jq -r '.workflow_runs[] | "• \(.name) - \(.status) - \(.conclusion // "in-progress")"'
