#!/bin/bash

# Script to configure Docker and Jenkins boot behavior

echo "Configuring Docker to start on boot..."
sudo systemctl enable docker

if [ $? -eq 0 ]; then
    echo "✅ Docker enabled to start on boot."
else
    echo "❌ Failed to enable Docker."
fi

echo "Configuring Jenkins to NOT start on boot..."
sudo systemctl disable jenkins

if [ $? -eq 0 ]; then
    echo "✅ Jenkins disabled from starting on boot."
else
    echo "❌ Failed to disable Jenkins."
fi

echo
echo "Current boot status:"
echo "---------------------"
echo "Docker:  $(systemctl is-enabled docker)"
echo "Jenkins: $(systemctl is-enabled jenkins)"

