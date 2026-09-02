#! /usr/bin/env bash
# mv only files that are actually there: an existing config dir with just one
# of the two files made the old unconditional mv fail.
DOTFILES_DIR="$HOME/.dotfiles/vscode"
CONFIG_DIR="$HOME/Library/Application Support/Code/User"

mkdir -p "$CONFIG_DIR"
for FILE in keybindings.json settings.json; do
    if [ -e "$CONFIG_DIR/$FILE" ] || [ -L "$CONFIG_DIR/$FILE" ]; then
        echo "backing up existing $CONFIG_DIR/$FILE"
        mv "$CONFIG_DIR/$FILE" "$CONFIG_DIR/$FILE.bak"
    fi
    echo "linking $DOTFILES_DIR/$FILE to $CONFIG_DIR/$FILE"
    ln -s "$DOTFILES_DIR/$FILE" "$CONFIG_DIR/$FILE"
done
