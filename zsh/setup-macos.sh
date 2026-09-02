#! /usr/bin/env bash
# Link targets must be absolute: "ln -s .zshrc ~/.zshrc" resolves the target
# relative to $HOME, so the link ends up pointing at itself (ELOOP).
DOTFILES_DIR="$HOME/.dotfiles/zsh"

link() {  # link SRC DEST
    if [ -e "$2" ] || [ -L "$2" ]; then
        echo "backing up existing $2"
        mv "$2" "$2.bak"
    fi
    echo "linking $1 to $2"
    ln -s "$1" "$2"
}

for FILE in .zshrc .zprofile; do
    link "$DOTFILES_DIR/$FILE" "$HOME/$FILE"
done

brew install starship
mkdir -p "$HOME/.config"
link "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"

brew install zsh-autosuggestions
