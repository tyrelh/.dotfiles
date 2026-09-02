# zsh / ohmyzsh
apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# installing ohmyzsh will already back up the existing .zshrc
rm ~/.zshrc
# absolute target: a relative one resolves against $HOME and self-links
ln -s "$HOME/.dotfiles/zsh/.zshrc" ~/.zshrc

# powerline10k

# neovim
# mkdir ~/.config
# mkdir ~/.config/nvim
# ln -s "$HOME/.dotfiles/.config/nvim/init.vim" ~/.config/nvim/init.vim
# ln -s "$HOME/.dotfiles/.config/nvim/ultisnips" ~/.config/nvim/ultisnips
