#!/bin/bash

# Update apt-get
sudo apt-get update -y

# Install nginx
sudo apt-get install -y nginx

# Start nginx
sudo systemctl start nginx

# Enable nginx to start on boot
sudo systemctl enable nginx

echo "<h1>Nginx installed successfully</h1><p>By: Engr. Ghulam Ali Sanpal</p>" | sudo tee /var/www/html/index.html

