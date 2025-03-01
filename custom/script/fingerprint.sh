#!/bin/bash

# Install fprint using pacman
echo "Installing fprintd and libfprint..."
sudo pacman -S --needed --noconfirm \
    fprintd \
    libfprint || { echo "Failed to install packages for Fingerprint Scanner"; exit 1; }
echo "fprintd and libfprint installed successfully."

# Enable and start fprintd service
echo "Enabling and starting fprintd service..."
sudo systemctl enable --now fprintd || { echo "Failed to enable and start fprintd service"; exit 1; }
echo "fprintd service enabled and started successfully."

# Enroll fingerprint for user 'vishnu'
echo "Enrolling fingerprint for user 'vishnu'..."
sudo fprintd-enroll vishnu || { echo "Failed to enroll fingerprint for user 'vishnu'"; exit 1; }
echo "Fingerprint enrolled successfully for user 'vishnu'."

# Verify fingerprint for user 'vishnu'
echo "Verifying fingerprint for user 'vishnu'..."
fprintd-verify vishnu
echo "Fingerprint verified successfully for user 'vishnu'."

# Remove existing SDDM PAM configuration
echo "Removing existing SDDM PAM configuration..."
sudo rm -rf /etc/pam.d/sddm || { echo "Failed to remove existing sddm PAM configuration"; exit 1; }
echo "Existing SDDM PAM configuration removed successfully."

# Copy custom SDDM PAM configuration
echo "Copying custom SDDM PAM configuration..."
sudo cp -rf ~/temp/dotfiles/custom/sddm /etc/pam.d/ || { echo "Failed to copy custom sddm PAM configuration"; exit 1; }
echo "Custom SDDM PAM configuration copied successfully."
