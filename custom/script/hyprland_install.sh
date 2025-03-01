#!/bin/bash

# Install Hyprland and related packages from AUR
echo "Installing Hyprland and related packages..."
yay -S --needed --noconfirm hyprland-meta-git
echo "Installing any missing packages"
yay -S --needed --noconfirm \
    hyprland-git \
    hyprland-protocols-git \
    aquamarine-git \
    xdg-desktop-portal-hyprland-git \
    hyprwayland-scanner-git \
    hyprgraphics-git \
    hyprcursor-git \
    hypridle-git \
    hyprlang-git \
    hyprlock-git \
    hyprshot-git \
    hyprutils-git \
    hyprpolkitagent-git
echo "Hyprland and related packages installed."
