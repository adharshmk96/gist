#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if redis-server is installed and running
if command_exists redis-server; then
  echo "Redis server is already installed."
else
  echo "Redis server not found. Installing..."
  sudo apt-get update  # Update package lists
  sudo apt-get install -y redis-server  # Install redis-server
fi

# Check if redis-cli is installed
if command_exists redis-cli; then
  echo "Redis CLI is already installed."
else
  echo "Redis CLI not found. Installing..."
  sudo apt-get install -y redis-tools  # Install redis-tools (includes redis-cli)
fi

# Verify Redis installation
if command_exists redis-cli; then
  redis_response=$(redis-cli ping)
  if [ "$redis_response" = "PONG" ]; then
    echo "Redis installation and connection successful!"
  else
    echo "Redis installation was successful, but connection failed."
  fi
else
  echo "Redis installation failed."
fi
