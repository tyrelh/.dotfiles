
plugins=(
  git
  aws
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions?tab=readme-ov-file
)


# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
export JDK_HOME=$JAVA_HOME
export JRE_HOME=$JAVA_HOME/jre
export _JAVA_OPTIONS="-Xms512m -Xmx4096m"

# Node
# export NODE_OPTIONS="--max-old-space-size=8192" # This prevents the issue of running out of memory for nodeJS.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cloudflare
export PATH="$PATH:/opt/cloudflared"

# go path
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH/bin"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# alias vim=nvim
alias ls=lsd
alias lst='lsd -A --tree --depth 4'
alias lsa='lsd -1A'
alias n=nvim
alias vv='cd ~/.config/nvim && nvim'
alias c=zoxide

# kitty theme switcher
function kt() {
  theme="Catppuccin-Macchiato"
  if [[ $1 == "light" ]]; then
    theme="Catppuccin-Latte"
  fi
  echo "Switching to $theme"
  # kitty @ set-colors -a -c ~/.config/kitty/themes/$theme.conf
  kitty +kitten themes --reload-in=all $theme
}

# yazi wrapper
# when exiting yazi this sets your terminal to the directory yazi was in
# function yy() {
#   echo "Yazi"
#   local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
#   yazi "$@" --cwd-file="$tmp"
#   if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
#     builtin cd -- "$cwd"
#   fi
#   rm -f -- "$tmp"
# }

# obsidian wrapper
function oo() {
  echo "Obsidian"
  cd ~/Notes/
  nvim
}

# dotfiles wrapper
# function dd() {
#   echo "Dotfiles"
#   cd ~/.dotfiles/
#   nvim
# }

# vscode wrapper
function cc() {
  echo "Zoxide cd to $1"
  z $1
  echo "VSCode cwd"
  code .
}

function printpath() {
  echo -e ${PATH//:/'\n'}
}

source <(fzf --zsh)
eval "$(zoxide init zsh)"

export STARSHIP_CONFIG="$HOME/.config/starship.toml"
eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# postgres
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
function vhs() {
  echo "Using Docker image for VHS to generate gif"
  docker run --rm -v $PWD:/vhs ghcr.io/charmbracelet/vhs "$@"
}

echo "Oh hi 👋"