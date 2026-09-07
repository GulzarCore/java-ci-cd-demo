#!/bin/bash

# Simple deployment to staging
# In production, this would deploy to Kubernetes, ECS, etc.

REGISTRY="ghcr.io"
OWNER=$1
IMAGE="$REGISTRY/$OWNER/java-ci-cd-demo:latest"

echo "Pulling latest image: $IMAGE"
docker pull $IMAGE

echo "Stopping old container (if exists)"
docker stop java-ci-cd-demo-staging 2>/dev/null || true
docker rm java-ci-cd-demo-staging 2>/dev/null || true

echo "Starting new container"
docker run -d \
  --name java-ci-cd-demo-staging \
  -p 8080:8080 \
  $IMAGE

echo "Container running. Check logs:"
docker logs java-ci-cd-demo-staging
