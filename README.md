# 🧩 Arch Linux Dotfiles — mrsanitizer

My personal Arch Linux dotfiles for a clean, minimal, and fast Wayland setup using **Hyprland**, **Waybar**, **Kitty**, **Zsh**, and more — all managed with **GNU Stow** for easy symlinking.

> **💡 Powered by:** Hyprland (Wayland) • PipeWire • NVIDIA OPEN DKMS • SDDM

---

## 🎨 Showcase

- **WM**: Hyprland (Wayland compositor)
- **Shell**: Zsh with Oh My Zsh + Powerlevel10k
- **Terminal**: Kitty (transparency + custom colors)
- **Status Bar**: Waybar (custom Hyprland styling)
- **Launcher**: Rofi (custom themes from [adi1090x/rofi](https://github.com/adi1090x/rofi)) + Wofi
- **File Manager**: Dolphin (Sweet Nova theme + Candy icons)
- **Notifications**: Dunst
- **Login Manager**: SDDM (Astronaut theme)
- **Bootloader Theme**: GRUB ([Minegrub theme](https://github.com/Lxtharia/minegrub-theme))
- **Audio**: PipeWire + WirePlumber + pipewire-pulse

---

## 📦 What's Inside

| Path / Config | Description |
|----------------|-------------|
| `.bashrc` | Backup Bash configuration |
| `.zshrc` | Zsh configuration with Oh My Zsh |
| `.p10k.zsh` | Powerlevel10k prompt theme configuration |
| `.config/hypr/` | Hyprland window manager configuration |
| `.config/waybar/` | Waybar status bar setup |
| `.config/kitty/` | Kitty terminal config (transparency, colors) |
| `.config/rofi/` | Rofi launcher themes (adi1090x collection) |
| `.config/wofi/` | Wofi application launcher config |
| `.config/dunst/` | Dunst notification daemon |
| `.config/spotify-launcher.conf` | Spotify (blur removed) |
| `.config/electron-flags.conf` | Electron apps optimization (VSCode, etc.) |
| `.config/fontconfig/` | Font and rendering configuration |
| `.config/Kvantum/` | Kvantum theme engine config |
| `.local/share/dolphin/` | Dolphin file manager customizations |
| `/etc/sddm.conf.d/` | SDDM login manager theme config |
| `/etc/default/grub` | GRUB bootloader with Minegrub theme |

---

## 🧰 Installation

### Prerequisites

Make sure you have `git`, `stow`, and `yay` (AUR helper) installed:

```bash
sudo pacman -S git stow base-devel
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
```

### 1. Core System Packages

```bash
sudo pacman -S --needed \
  hyprland \
  waybar \
  kitty \
  zsh \
  dolphin \
  network-manager-applet \
  blueman \
  dunst \
  pavucontrol \
  pipewire \
  pipewire-pulse \
  wireplumber \
  xdg-desktop-portal-hyprland \
  spotify-launcher \
  kvantum \
  sddm \
  power-profiles-daemon \
  ttf-firacode-nerd \
  rofi \
  wofi
```

### 2. NVIDIA Drivers (if applicable)

```bash
sudo pacman -S nvidia-dkms nvidia-utils nvidia-settings
```

### 3. AUR Packages

```bash
yay -S \
  networkmanager-dmenu-git \
  visual-studio-code-bin \
  oh-my-zsh-git \
  powerlevel10k \
  candy-icons-git\
  qt6ct-kde
```

### 4. Themes & Icons

#### Sweet Nova Theme (Dolphin/Qt)
```bash
git clone https://github.com/EliverLara/Sweet.git ~/.local/share/themes/Sweet-nova
yay -S kvantum-theme-sweet-git
```

Then apply via **Kvantum Manager** and **qt6ct**.

#### Rofi Themes (adi1090x)
```bash
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi && chmod +x setup.sh && ./setup.sh
```

#### Minegrub Theme
```bash
git clone https://github.com/Lxtharia/minegrub-theme.git
cd minegrub-theme
sudo ./install.sh
```

---

## 🔗 Dotfiles Setup (GNU Stow)

### Clone the Repository

```bash
git clone https://github.com/mrsanitizer/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### Stow Configurations

Use `stow` to symlink the configs you want:

```bash
# Stow all configs
stow */

# Or stow individual configs
stow hypr
stow waybar
stow kitty
stow zsh
stow dunst
stow rofi
```

### Oh My Zsh + Powerlevel10k Setup

```bash
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Configure p10k
p10k configure
```

---

## 🎨 Theming Guide

### Dolphin (File Manager)
1. Apply **Sweet Nova** via **System Settings → Appearance → Application Style**
2. Set **Candy Icons** in **System Settings → Icons**
3. Use **Kvantum** for Qt theming: `kvantummanager` → Select Sweet theme

### SDDM (Login Manager)
```bash
# Install Astronaut theme
yay -S sddm-theme-astronaut
sudo systemctl enable sddm
```

Edit `/etc/sddm.conf.d/theme.conf`:
```ini
[Theme]
Current=astronaut
```

### Waybar + Hyprland
Colors and styling are in `.config/waybar/style.css` — edit to match your theme.

---

## ⚡ Post-Installation

### Enable Services
```bash
sudo systemctl enable --now bluetooth
sudo systemctl enable --now power-profiles-daemon
systemctl --user enable --now pipewire pipewire-pulse wireplumber
```

### NetworkManager with dmenu
Configure `networkmanager_dmenu` for WiFi/VPN quick access via Rofi/dmenu.

### Default Shell (Zsh)
```bash
chsh -s $(which zsh)
```

---

## 🛠️ Configuration Tips

- **Hyprland keybinds**: Edit `~/.config/hypr/hyprland.conf`
- **Waybar modules**: Customize in `~/.config/waybar/config`
- **Kitty transparency**: Adjust in `~/.config/kitty/kitty.conf`
- **Rofi themes**: Switch via `rofi-theme-selector`
- **In General**: Just copy the configs I have all of them are relative to my home directory except the grub.
---

## 📸 Screenshots

> Add your screenshots here to show off your setup!

---

## 📝 Credits & Resources

- [Hyprland](https://hyprland.org/) — Wayland compositor
- [adi1090x Rofi Themes](https://github.com/adi1090x/rofi)
- [Sweet Theme by EliverLara](https://github.com/EliverLara/Sweet/tree/nova)
- [Minegrub Theme](https://github.com/Lxtharia/minegrub-theme)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Oh My Zsh](https://ohmyz.sh/)

---

## 📄 License

MIT License — feel free to use and modify!

---

**Enjoy your rice! 🍚✨**