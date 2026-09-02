#! /usr/bin/env bash
# Wezterm reads ~/.wezterm.lua, so the link lives in $HOME. Symlink targets are
# resolved relative to the link's own directory, which makes a bare
# "wezterm.lua" point at ~/wezterm.lua — always pass the absolute path.
DOTFILES_DIR="$HOME/.dotfiles/wezterm"
CONFIG_FILE="$HOME/.wezterm.lua"

if [ -e "$CONFIG_FILE" ] || [ -L "$CONFIG_FILE" ]; then
    echo "backing up existing $CONFIG_FILE"
    mv "$CONFIG_FILE" "$CONFIG_FILE.bak"
fi
echo "linking $DOTFILES_DIR/wezterm.lua to $CONFIG_FILE"
ln -s "$DOTFILES_DIR/wezterm.lua" "$CONFIG_FILE"
