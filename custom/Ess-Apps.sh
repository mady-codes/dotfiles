# Install terminal emulator and file manager
echo "Installing Kitty and Thunar..."
sudo pacman -S --needed --noconfirm \
    kitty \
    kitty-shell-integration \
    kitty-terminfo \
    thunar \
    thunar-archive-plugin \
    thunar-media-tags-plugin \
    thunar-shares-plugin \
    thunar-vcs-plugin \
    thunar-volman \
    xarchiver || { echo "Failed to install Kitty and Thunar"; exit 1; }
echo "Kitty and Thunar installed."

# Install SDDM packages
echo "Installing SDDM packages..."
sudo pacman --noconfirm --needed -S \
    sddm \
    qt6-svg \
    qt6-virtualkeyboard \
    qt6-multimedia-ffmpeg || { echo "Failed to install SDDM packages"; exit 1; }
echo "SDDM packages installed."

# Configure SDDM theme
echo "Configuring SDDM theme..."
sudo cp -rf ~/temp/dotfiles/joker /usr/share/sddm/themes/ || { echo "Failed to copy SDDM theme"; exit 1; }
sudo cp -rf ~/temp/dotfiles/custom/sddm.conf /etc/ || { echo "Failed to copy SDDM config"; exit 1; }
sudo mkdir -p /usr/share/fonts/Electroharmonix || { echo "Failed to create font directory"; exit 1; }
sudo cp -rf /usr/share/sddm/themes/joker/Fonts/* /usr/share/fonts/Electroharmonix || { echo "Failed to copy fonts"; exit 1; }
sudo systemctl enable sddm.service || { echo "Failed to enable SDDM service"; exit 1; }
echo "SDDM theme configured."

# Configure GRUB theme
echo "Configuring GRUB theme..."
sudo pacman -S --needed --noconfirm os-prober || { echo "Failed to install os-prober"; exit 1; }
sudo rm -rf /etc/default/grub || { echo "Failed to remove existing GRUB config"; exit 1; }
sudo cp -rf ~/temp/dotfiles/custom/grub /etc/default/ || { echo "Failed to copy new GRUB config"; exit 1; }
sudo cp -rf sekiro /usr/share/grub/themes || { echo "Failed to copy GRUB theme"; exit 1; }
sudo grub-mkconfig -o /boot/grub/grub.cfg || { echo "Failed to generate GRUB config"; exit 1; }
echo "GRUB theme configured."
