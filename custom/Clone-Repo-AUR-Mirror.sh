#!/bin/bash

# Create and navigate to the temp directory
mkdir -p ~/temp
cd ~/temp || { echo "Failed to change directory to ~/temp"; exit 1; }

# Clone the dotfiles repository
git clone https://github.com/mady-codes/dotfiles.git || { echo "Failed to clone repository"; exit 1; }
cd ~ || { echo "Failed to change directory to home"; exit 1; }

# Replace pacman.conf
sudo rm -rf /etc/pacman.conf
sudo cp -rf ~/temp/dotfiles/custom/pacman.conf /etc/ || { echo "Failed to copy pacman.conf"; exit 1; }

# Update system packages
echo "Updating system packages..."
sudo pacman -Syu || { echo "Failed to update system packages"; exit 1; }
echo "System packages updated."

# Install AUR helper
echo "Installing AUR helper..."
mkdir -p ~/aur
cd ~/aur || { echo "Failed to change directory to ~/aur"; exit 1; }
sudo pacman -S --needed git base-devel || { echo "Failed to install base-devel"; exit 1; }
git clone https://aur.archlinux.org/yay.git || { echo "Failed to clone yay repository"; exit 1; }
cd yay || { echo "Failed to change directory to yay"; exit 1; }
makepkg -si || { echo "Failed to make and install yay"; exit 1; }
cd ~
echo "AUR helper installed."

# Update mirrorlist
echo "Updating mirrorlist..."
yay -S rate-mirrors --noconfirm || { echo "Failed to install rate-mirrors"; exit 1; }
rate-mirrors --protocol https arch | sudo tee /etc/pacman.d/mirrorlist || { echo "Failed to update mirrorlist"; exit 1; }
sudo pacman -Syy || { echo "Failed to sync package database"; exit 1; }
echo "Mirrorlist updated."