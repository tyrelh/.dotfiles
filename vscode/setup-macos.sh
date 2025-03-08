#! /usr/bin/env bash
CONFIG_DIR="$HOME/Library/Application Support/Code/User"

if [ -d "$CONFIG_DIR" ]; then
    mv "$CONFIG_DIR/keybindings.json" "$CONFIG_DIR/keybindings.json.bak"
    mv "$CONFIG_DIR/settings.json" "$CONFIG_DIR/settings.json.bak"
    echo "Backed up existing keybindings.json and settings.json to keybindings.json.bak and settings.json.bak"
else
    mkdir -p "$CONFIG_DIR"
    echo "Created $CONFIG_DIR"
fi

ln -s "$HOME/.dotfiles/vscode/keybindings.json" "$CONFIG_DIR/keybindings.json"
ln -s "$HOME/.dotfiles/vscode/settings.json" "$CONFIG_DIR/settings.json"
echo "Linked keybindings.json and settings.json from dotfiles repo to $CONFIG_DIR"