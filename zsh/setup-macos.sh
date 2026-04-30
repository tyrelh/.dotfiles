mv ~/.zshrc ~/.zshrc.bak
ln -s .zshrc ~/.zshrc

mv ~/.zprofile ~/.zprofile.bak
ln -s .zprofile ~/.zprofile

brew install starship
mv ~/.config/starship.toml ~/.config/starship.toml.bak
ln -s starship.toml ~/.config/starship.toml

brew install zsh-autosuggestions
