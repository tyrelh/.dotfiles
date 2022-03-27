sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s .zshrc ~/.zshrc
mkdir ~/.config
mkdir ~/.config/nvim
ln -s .config/nvim/init.vim ~/.config/nvim/init.vim
ls -s .config/nvim/ultisnips ~/.config/nvim/ultisnips
