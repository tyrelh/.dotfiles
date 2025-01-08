#! /usr/bin/env bash
if [ -d "~/.config/ghostty" ]; then
    mv ~/.config/ghostty/config ~/.config/ghostty/config.bak
else
    mkdir ~/.config/ghostty
fi
ln -s ~/.dotfiles/ghostty/config ~/.config/ghostty/config