# dotfiles
* neovim
* zsh / ohmyzsh

## install zsh
sudo apt update
sudo apt install zsh

## install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## install nerd font
https://www.nerdfonts.com/font-downloads

## install powerline10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

rm ~/.zshrc
ln -s .zshrc ~/.zshrc
mkdir ~/.config
mkdir ~/.config/nvim
ln -s .config/nvim/init.vim ~/.config/nvim/init.vim
ls -s .config/nvim/ultisnips ~/.config/nvim/ultisnips
