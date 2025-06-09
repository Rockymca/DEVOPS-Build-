#!/bin/bash

echo " Building Docker imag"
docker build -t react-app:latest .

echo " Starting with Docker Compos"
docker-compose up -d

echo " Deployment complete!"
