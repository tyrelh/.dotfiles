#! /usr/bin/env bash
DOTFILES_DIR="$HOME/.dotfiles/zed"
CONFIG_DIR="$HOME/.config/zed"
CONFIG_FILE="settings.json"
KEYMAP_FILE="keymap.json"

mkdir -p "$CONFIG_DIR"
for FILE in "$CONFIG_FILE" "$KEYMAP_FILE"; do
    if [ -e "$CONFIG_DIR/$FILE" ] || [ -L "$CONFIG_DIR/$FILE" ]; then
        echo "backing up existing file $CONFIG_DIR/$FILE"
        mv "$CONFIG_DIR/$FILE" "$CONFIG_DIR/$FILE.bak"
    fi
    echo "linking $DOTFILES_DIR/$FILE to $CONFIG_DIR/$FILE"
    ln -s "$DOTFILES_DIR/$FILE" "$CONFIG_DIR/$FILE"
done
