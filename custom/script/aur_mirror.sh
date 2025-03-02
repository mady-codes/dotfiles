#!/bin/bash

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
cd ~/aur/yay || { echo "Failed to change directory to yay"; exit 1; }
makepkg -si || { echo "Failed to make and install yay"; exit 1; }
cd ~
echo "AUR helper installed."

# Update mirrorlist
echo "Updating mirrorlist..."
yay -S rate-mirrors --noconfirm || { echo "Failed to install rate-mirrors"; exit 1; }
rate-mirrors --protocol https arch | sudo tee /etc/pacman.d/mirrorlist || { echo "Failed to update mirrorlist"; exit 1; }
sudo pacman -Syy || { echo "Failed to sync package database"; exit 1; }
echo "Mirrorlist updated."

# Install mkinitcpio-firmware and add console font
echo "Editing vconsole.conf"
sudo sh -c 'echo "FONT=lat9w-16" >> /etc/vconsole.conf' || { echo "Failed to update vconsole.conf"; exit 1; }
echo "vconsole.conf updated"


echo "Installing mkinitcpio-firmware"
yay -S mkinitcpio-firmware --noconfirm || { echo "Failed to install mkinitcpio-firmware"; exit 1; }
echo "mkinitcpio-firmware installed." 
