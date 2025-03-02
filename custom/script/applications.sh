#!/bin/bash

echo "Installing essential packages with pacman..."
sudo pacman -S --needed --noconfirm \
    zsh \
    fzf \
    rofi-wayland \
    swaync \
    loupe \
    fastfetch \
    bluez \
    nwg-look \
    kvantum \
    pamixer \
    pavucontrol \
    qt5-wayland \
    qt6-wayland \
    qt5ct \
    kvantum-qt5 || { echo "Failed to install essential packages with pacman"; exit 1; }
echo "Essential packages installed successfully."

echo "Installing Python packages with pacman..."
sudo pacman -S --needed --noconfirm \
    python \
    python-autocommand \
    python-charset-normalizer \
    python-dbus \
    python-gobject \
    python-idna \
    python-jaraco.collections \
    python-jaraco.context \
    python-jaraco.functools \
    python-jaraco.text \
    python-jinja \
    python-markupsafe \
    python-more-itertools \
    python-packaging \
    python-platformdirs \
    python-requests \
    python-setproctitle \
    python-setuptools \
    python-tqdm \
    python-unidecode \
    python-urllib3 \
    python-wheel || { echo "Failed to install Python packages with pacman"; exit 1; }
echo "Python packages installed successfully."

echo "Installing additional packages with yay..."
yay -S --needed --noconfirm \
    librewolf-bin \
    waybar-git \
    swww-git \
    blueberry-wayland \
    janus \
    brightnessctl-git || { echo "Failed to install additional packages with yay"; exit 1; }
echo "Additional packages installed successfully."

echo "Installing qt6ct-kde with yay..."
yay -S --needed --noconfirm qt6ct-kde || { echo "Failed to install qt6ct-kde with yay"; exit 1; }
echo "qt6ct-kde installed successfully."

# Copy everything from ~/temp/dotfiles/zsh/ directory to home directory
echo "Copying Zsh configuration to home directory..."
cp -rf ~/temp/dotfiles/zsh/{*,.*} "$HOME/" || { echo "Failed to copy Zsh configuration"; exit 1; }
echo "Zsh configuration copied to home directory."

# Check if .themes directory exists in the home directory
if [ ! -d "$HOME/.themes" ]; then
    echo ".themes directory does not exist. Creating it now..."
    mkdir -p "$HOME/.themes" || { echo "Failed to create .themes directory"; exit 1; }
else
    echo ".themes directory already exists."
fi

# Copy contents of ~/temp/dotfiles/custom/.themes/* to ~/.themes
echo "Copying themes..."
cp -rf ~/temp/dotfiles/custom/.themes/* "$HOME/.themes/" || { echo "Failed to copy themes"; exit 1; }
echo "Themes copied successfully."

# Create symlink for assets folder
echo "Creating symlink for assets folder..."
ln -s ~/.themes/Dracula/assets "$HOME/.config/assets" || { echo "Failed to create symlink"; exit 1; }
echo "Symlink for assets folder created successfully."

# Copy gtk-4.0 folder to ~/.config
echo "Copying gtk-4.0 folder to ~/.config..."
cp -rf ~/.themes/Dracula/gtk-4.0 "$HOME/.config/" || { echo "Failed to copy gtk-4.0 folder"; exit 1; }
echo "gtk-4.0 folder copied successfully."

# Check if .icons directory exists in the home directory
if [ ! -d "$HOME/.icons" ]; then
    echo ".icons directory does not exist. Creating it now..."
    mkdir -p "$HOME/.icons" || { echo "Failed to create .icons directory"; exit 1; }
else
    echo ".icons directory already exists."
fi

# Copy contents of ~/temp/dotfiles/custom/.icons/* to ~/.icons
echo "Copying icons..."
cp -rf ~/temp/dotfiles/custom/.icons/* "$HOME/.icons/" || { echo "Failed to copy icons"; exit 1; }
echo "Icons copied successfully."

echo "Installing Android Tweaks..."
sudo pacman -S --needed --noconfirm mtpfs || { echo "Failed to install mtpfs with pacman"; exit 1; }
yay -S --needed --noconfirm jmtpfs || { echo "Failed to install jmtpfs with yay"; exit 1; }
sudo pacman -Sy --needed --noconfirm gvfs-mtp || { echo "Failed to install gvfs-mtp with pacman"; exit 1; }
sudo pacman -Sy --needed --noconfirm gvfs-gphoto2 || { echo "Failed to install gvfs-gphoto2 with pacman"; exit 1; }
echo "Android Tweaks Installed successfully."

echo "Activating Bluetooth..."
sudo systemctl enable bluetooth.service || { echo "Failed to enable bluetooth service"; exit 1; }
echo "Bluetooth Activated Successfully."

echo "Installing archive utilities packages with pacman..."
sudo pacman -S --needed --noconfirm \
    cpio \
    lzo \
    p7zip \
    unrar \
    unzip \
    zip \
    arj \
    binutils \
    bzip2 \
    gzip \
    lha \
    lrzip \
    lz4 \
    lzip \
    lzop \
    tar \
    xdg-utils \
    xz \
    zstd || { echo "Failed to install archive utilities packages with pacman"; exit 1; }
echo "Archive utilities packages installed successfully."
