#!/bin/bash

# Step 1: Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "❌ Docker not found. Please install Docker first."
    exit 1
fi

# Step 2: Build the Docker image
echo "🐳 Building Docker image..."
docker-compose build

# Step 3: Start the app using docker-compose
echo "🚀 Starting containers..."
docker-compose up -d

# Step 4: Wait for a few seconds
sleep 5

# Step 5: Check if the Node.js container is running
if [ "$(docker ps -q -f name=devops-test-app)" ]; then
    echo "✅ App is running successfully!"
    docker ps --filter "name=devops-test-app"
else
    echo "❌ App failed to start. Check logs using: docker-compose logs"
    exit 1
fi
