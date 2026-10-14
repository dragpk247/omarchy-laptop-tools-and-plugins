#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"
PLUGINS_DIR="${HOME}/.config/omarchy/plugins"

mkdir -p "$BIN_DIR"
mkdir -p "$PLUGINS_DIR"

echo "=== Installing Omarchy Laptop Tools & Plugins ==="

# 1. Install helper scripts to ~/.local/bin
echo "Installing helper scripts to $BIN_DIR..."
for script in "$SCRIPT_DIR/bin/"*; do
  if [ -f "$script" ]; then
    fname=$(basename "$script")
    ln -sf "$script" "$BIN_DIR/$fname"
    chmod +x "$BIN_DIR/$fname"
    echo "  -> Linked $BIN_DIR/$fname"
  fi
done

# 2. Install plugins to ~/.config/omarchy/plugins
echo "Installing plugins to $PLUGINS_DIR..."
# GPU Switcher modular widget
if [ -d "$SCRIPT_DIR/plugins/gpu-switcher" ]; then
  ln -sfn "$SCRIPT_DIR/plugins/gpu-switcher" "$PLUGINS_DIR/user.gpu-switcher"
  echo "  -> Linked $PLUGINS_DIR/user.gpu-switcher"
fi

# Laptop Power bar widget (Integrated battery + GPU menu)
if [ -d "$SCRIPT_DIR/plugins/laptop-power" ]; then
  ln -sfn "$SCRIPT_DIR/plugins/laptop-power" "$PLUGINS_DIR/jpi.power"
  echo "  -> Linked $PLUGINS_DIR/jpi.power"
fi

echo "=== Installation complete! ==="
echo "Note: Reload Omarchy Shell or re-add widgets in bar settings if needed."
