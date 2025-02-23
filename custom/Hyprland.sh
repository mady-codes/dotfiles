# Install Hyprland and related packages from AUR
echo "Installing Hyprland and related packages..."
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

# Check if .config directory exists and create it if it doesn't
if [ ! -d "$HOME/.config" ]; then
  echo "Creating .config directory..."
  mkdir -p "$HOME/.config" || { echo "Failed to create .config directory"; exit 1; }
fi

# Copy all files and folders from ~/temp/dotfiles/.config/ to .config
echo "Copying dotfiles to .config directory..."
cp -rf ~/temp/dotfiles/.config/* "$HOME/.config/" || { echo "Failed to copy dotfiles"; exit 1; }
echo "Dotfiles copied to .config directory."

# Copy resources folder and all its contents from ~/temp/dotfiles/ to home directory
echo "Copying resources folder to home directory..."
cp -rf ~/temp/dotfiles/resources "$HOME/" || { echo "Failed to copy resources folder"; exit 1; }
echo "Resources folder copied to home directory."

# Copy everything from ~/temp/dotfiles/zsh/ directory to home directory
echo "Copying Zsh configuration to home directory..."
cp -rf ~/temp/dotfiles/zsh/* "$HOME/" || { echo "Failed to copy Zsh configuration"; exit 1; }
echo "Zsh configuration copied to home directory."

# Check if ~/.local/share/fonts directory exists and create it if it doesn't
if [ ! -d "$HOME/.local/share/fonts" ]; then
  echo "Creating ~/.local/share/fonts directory..."
  mkdir -p "$HOME/.local/share/fonts" || { echo "Failed to create ~/.local/share/fonts directory"; exit 1; }
fi

# Copy all contents from ~/temp/dotfiles/fonts/ to ~/.local/share/fonts
echo "Copying fonts to ~/.local/share/fonts directory..."
cp -rf ~/temp/dotfiles/fonts/* "$HOME/.local/share/fonts/" || { echo "Failed to copy fonts"; exit 1; }
echo "Fonts copied to ~/.local/share/fonts directory."

# Update font cache
echo "Updating font cache"
fc-cache -fv || { echo "Failed to update font cache"; exit 1; }
echo "Font cache updated"