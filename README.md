# 🧩 Arch Linux Dotfiles — mrsanitizer

My personal Arch Linux dotfiles for a clean, minimal, and fast Wayland setup using **Hyprland**, **Waybar**, **Kitty**, **Bash**, and **Spotify** — powered by **PipeWire** audio.

---

## ⚙️ Configs Included

| Path / Config | Description |
|----------------|-------------|
| `.bashrc` | Custom Bash setup (aliases, colors, prompt, etc.) |
| `.config/hypr/` | Hyprland window manager configuration |
| `.config/waybar/` | Waybar status bar setup |
| `.config/spotify-launcher.conf` | Spotify Blurr Removed|
| `.config/electron-flags.conf` | Optimized flags for Electron-based apps (VSCode) |
| `.config/dunst/` | Notification daemon (Dunst) configuration |
| `.config/fontconfig/` | Font and rendering configuration |

---

## 🧰 Installation (Packages)

### Core System Packages

```bash
sudo pacman -S --needed \
  hyprland \
  waybar \
  kitty \
  bash \
  git \
  dolphin \
  network-manager-applet \
  blueman \
  dunst \
  pavucontrol \
  pipewire \
  pipewire-pulse \
  wireplumber \
  xdg-desktop-portal-hyprland\
  spotify-launcher\
  ttf-nerd-font-firacode\
```
### Installion from yay
```bash
yay networkmanager-dmenu.git
yay vscode
``````
