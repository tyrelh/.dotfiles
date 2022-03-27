# zsh / ohmyzsh
apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# installing ohmyzsh will already back up the existing .zshrc
rm ~/.zshrc
ln -s .zshrc ~/.zshrc

# powerline10k

# neovim
# mkdir ~/.config
# mkdir ~/.config/nvim
# ln -s .config/nvim/init.vim ~/.config/nvim/init.vim
# ls -s .config/nvim/ultisnips ~/.config/nvim/ultisnips
