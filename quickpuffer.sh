#!/bin/bash

# Check if the script is running as root (with sudo)
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo or as root."
  exit 1
fi

# Install the PufferPanel repository
echo "Adding PufferPanel repository..."
curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | sudo bash

# Install PufferPanel
echo "Installing PufferPanel..."
sudo apt-get install -y pufferpanel

# Create a PufferPanel user (this will prompt for email, password, and admin status)
echo "Creating PufferPanel user..."
sudo pufferpanel user add

# Enable and start PufferPanel service
echo "Enabling and starting PufferPanel service..."
sudo systemctl enable --now pufferpanel

echo "PufferPanel installation and setup complete! Script by Jimputin @ elysiannodes.uk"
