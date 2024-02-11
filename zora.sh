#!/bin/bash

# Check if docker is installed, else install it
if command -v docker &>/dev/null; then
  echo "Docker is already installed."
else
echo "Docker is not installed. Installing..."

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

# Check if Git is installed
if command -v git &>/dev/null; then
  echo "Git is already installed."
else
   echo "Installing git"
  sudo apt-get install git-all
fi


# Check if Python 3 is installed
if command -v python3 &>/dev/null; then
    echo "Python 3 is already installed."
else
    echo "Python 3 is not installed. Attempting to install..."

    # Attempt to identify the package manager
    if command -v apt-get &>/dev/null; then
        # Debian-based distributions (Ubuntu, Debian)
        sudo apt-get update
        sudo apt-get install -y python3
    elif command -v yum &>/dev/null; then
        # Red Hat-based distributions (CentOS, Fedora)
        sudo yum update
        sudo yum install -y python3
    else
        echo "Could not identify package manager. Please install Python 3 manually."
        exit 1
    fi

    # Verify Python 3 installation
    if command -v python3 &>/dev/null; then
        echo "Python 3 has been successfully installed."
    else
        echo "Failed to install Python 3."
        exit 1
    fi
fi

# for Zora Mainnet
export CONDUIT_NETWORK=zora-mainnet-0

git clone https://github.com/conduitxyz/node.git






