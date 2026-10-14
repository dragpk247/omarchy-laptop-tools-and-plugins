# Omarchy Laptop Tools and Plugins

A modular suite of laptop-specific utilities, bar widgets, and power management tools for Omarchy on Linux (optimized for ASUS ROG / Hybrid GPU laptops).

## Features

### 🔌 Modular Bar Widgets (`plugins/`)
1. **`user.gpu-switcher` (`plugins/gpu-switcher`)**:
   - Dedicated, standalone bar widget showing current GPU mode (`󰢮` Hybrid / `󰢯` Integrated).
   - One-click toggling between Integrated (power-saver) and Hybrid (discrete NVIDIA GPU active) modes using `supergfxctl`.
2. **`jpi.power` / `laptop-power` (`plugins/laptop-power`)**:
   - Power & battery widget with interactive GPU mode switching directly in the power flyout menu.
   - Real-time battery status, charging rates, power profiles (`powerprofilesctl`), and ASUS battery charge limits.

### 🛠️ Helper Scripts (`bin/`)
- **`omarchy-battery-drain`**: Real-time battery discharge audit (exact wattage, drain severity rating, top CPU consumers, display Hz, and dGPU wake status).
- **`omarchy-battery-health`**: Battery degradation percentage, wear level, cycle count, and charging threshold inspection.
- **`omarchy-refresh-toggle`**: Toggle display refresh rate cleanly between 60Hz and 120Hz without hardcoded outputs or setting leaks.
- **`omarchy-dock-manager`**: Display transition manager for docks and clamshell mode (auto-disables internal panel when lid is closed, restores 60Hz on undock).
- **`omarchy-audio-safeguard`**: PipeWire/WirePlumber safeguard daemon that immediately mutes speakers when headphones disconnect.
- **`omarchy-gpu-switch`**: Fast CLI helper to inspect status, query supported modes, and switch GPU profiles with desktop notifications.
- **`gpu-profile-switch`**: Unified switcher coordinating GPU (`supergfxctl`), system power profile (`powerprofilesctl`), and fan curve (`asusctl`).
- **`asus-battery-toggle`**: Toggle battery charge threshold between Desk Mode (80%) and Travel Mode (100%).

---

## Installation

Run the included installer to symlink all scripts into `~/.local/bin` and plugins into `~/.config/omarchy/plugins`:

```bash
git clone <repo-url> ~/Projects/omarchy-laptop-tools-and-plugins
cd ~/Projects/omarchy-laptop-tools-and-plugins
./install.sh
```

## Requirements
- `supergfxctl` (for hybrid GPU switching)
- `asusctl` (optional, for ASUS ROG laptops)
- `power-profiles-daemon` (`powerprofilesctl`)
- `omarchy` / Quickshell
