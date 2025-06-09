#!/bin/bash

echo "Stopping and removing old containers..."
docker-compose down

echo "Building the image and starting containers..."
docker-compose up -d --build

if [ $? -eq 0 ]; then
  echo "Deployment successful!"
else
  echo "Deployment failed!"
  exit 1
fi

