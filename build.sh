#!/bin/bash

# Variables
IMAGE_NAME="rakeshvar/myapp"     # Replace with your Docker Hub repo name
IMAGE_TAG="latest"               # You can also use git commit hash or build number

# Build Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG .

if [ $? -ne 0 ]; then
  echo "Docker build failed!"
  exit 1
fi

# Login to Docker Hub (make sure you're logged in or use env vars for credentials)
echo "Logging in to Docker Hub..."
docker login

if [ $? -ne 0 ]; then
  echo "Docker login failed!"
  exit 1
fi

# Push Docker image
echo "Pushing Docker image to Docker Hub..."
docker push $IMAGE_NAME:$IMAGE_TAG

if [ $? -ne 0 ]; then
  echo "Docker push failed!"
  exit 1
fi

echo "Build and push completed successfully!"
