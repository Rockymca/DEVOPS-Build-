#!/bin/bash

# Variables
DOCKER_USERNAME="rakeshvar"
TAG="latest"
CONTAINER_NAME="react-container"

# Pull latest image
echo "Pulling latest image from Docker Hub..."
docker pull $DOCKER_USERNAME/dev:$TAG

# Stop and remove existing container (if any)
echo "Stopping and removing old container (if exists)..."
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Run new container
echo "Starting new container on port 80..."
docker run -d --name $CONTAINER_NAME -p 80:80 $DOCKER_USERNAME/dev:$TAG

echo "Deployment complete!"
