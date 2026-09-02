#! /usr/bin/env bash
# A quoted "~" is not expanded by the shell, so the old -d test never matched
# and the existing config was never backed up.
DOTFILES_DIR="$HOME/.dotfiles/ghostty"
CONFIG_FILE="$HOME/.config/ghostty/config"

mkdir -p "$(dirname "$CONFIG_FILE")"
if [ -e "$CONFIG_FILE" ] || [ -L "$CONFIG_FILE" ]; then
    echo "backing up existing $CONFIG_FILE"
    mv "$CONFIG_FILE" "$CONFIG_FILE.bak"
fi
echo "linking $DOTFILES_DIR/config to $CONFIG_FILE"
ln -s "$DOTFILES_DIR/config" "$CONFIG_FILE"
