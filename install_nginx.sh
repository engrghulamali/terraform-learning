#!/bin/bash

# Add logging to a file
exec > /var/log/install_nginx.log 2>&1
echo "Starting Nginx Installation"

# Update apt-get
sudo apt-get update -y
echo "Updated apt-get"

# Install nginx
sudo apt-get install -y nginx
echo "Installed nginx"

# Start nginx
sudo systemctl start nginx
echo "Started nginx"

# Enable nginx to start on boot
sudo systemctl enable nginx
echo "Enabled nginx to start on boot"

# Create custom index.html
echo "<h1>Nginx installed successfully</h1><p>By: Engr. Ghulam Ali Sanpal</p>" | sudo tee /var/www/html/index.html
echo "Created index.html"
