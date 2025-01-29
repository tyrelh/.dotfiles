mv ~/.zshrc ~/.zshrc.bak
ln .zshrc ~/.zshrc

brew install starship
mv ~/.config/starship.toml ~/.config/starship.toml.bak
ln starship.toml ~/.config/starship.toml

brew install zsh-autosuggestions