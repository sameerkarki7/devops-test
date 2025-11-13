#!/bin/bash
if ! command -v docker &> /dev/null
then
  echo "Docker not found. Please install Docker first."
  exit 1
fi

echo "Building Docker image..."
docker-compose build

echo "Starting containers..."
docker-compose up -d

sleep 5

if [ "$(docker ps -q -f name=nodeapp)" ]; then
  echo "✅ App is running successfully."
else
  echo "❌ App failed to start."
fi
