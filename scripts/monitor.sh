#!/bin/bash

echo "📊 Production Monitoring Dashboard"
echo "=================================="

PROD_PORT=9090
STAGING_PORT=8080

echo ""
echo "🔴 Production Status:"
if docker ps | grep java-ci-cd-demo-prod > /dev/null; then
  echo "✅ Container running"
  docker inspect java-ci-cd-demo-prod | grep -E '"State"' -A 5
else
  echo "❌ Container not running"
fi

echo ""
echo "🟡 Staging Status:"
if docker ps | grep java-ci-cd-demo-staging > /dev/null; then
  echo "✅ Container running"
else
  echo "⏸️  Container stopped"
fi

echo ""
echo "📝 Recent deployments:"
docker ps -a | grep java-ci-cd-demo | head -5

echo ""
echo "💾 Image versions in GHCR:"
echo "Run: docker images | grep ghcr.io"
