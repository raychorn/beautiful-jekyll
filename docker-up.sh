#!/bin/bash

# Script to build and run Jekyll project using Docker

# Remove the Gemfile.lock
echo "Removing Gemfile.lock..."
rm -f Gemfile.lock

docker-compose down --remove-orphans

# Build the Docker image without using the cache
echo "Building the Docker image..."
sudo docker-compose build --no-cache

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "Build successful. Starting the Jekyll server..."
    sudo docker-compose up
else
    echo "Build failed. Please check the error messages above."
fi
