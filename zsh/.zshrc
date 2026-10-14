
plugins=(
  git
  aws
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions?tab=readme-ov-file
)


# Java
# only set up if a JDK 17 is installed
if /usr/libexec/java_home -v 17 &>/dev/null; then
  export JAVA_HOME=$(/usr/libexec/java_home -v 17)
  export JDK_HOME=$JAVA_HOME
  export _JAVA_OPTIONS="-Xms512m -Xmx4096m"
fi

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

# python
alias pip=pip3
alias python=python3
export PATH="${PATH}:/Users/tyrel/Library/Python/3.9/bin"

# start zsh's completion system (provides compdef)
autoload -Uz compinit && compinit
# let zsh use bash-style completion scripts
autoload -U +X bashcompinit && bashcompinit
# tab completion for terraform
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# alias vim=nvim
alias ls=lsd
alias lst='lsd -A --tree --depth 4'
alias lsa='lsd -1A'
alias n=nvim
alias vv='cd ~/.config/nvim && nvim'
alias cc='echo "Checking for claude-code updates..." && brew upgrade claude-code@latest && echo "Launching claude code..." && claude --dangerously-skip-permissions && echo "Claude exited $?."'
alias zz='zed .'
alias code='echo "Checking for codex updates..." && brew upgrade --cask codex && echo "Launching codex..." && codex && echo "Codex exited $?."'

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

# ngrok
export NGROK_AUTHTOKEN="###"

# shortcut
export SHORTCUT_API_TOKEN="###"

export DD_API_KEY="###"

# function vhs() {
#   echo "Using Docker image for VHS to generate gif"
#   docker run --rm -v $PWD:/vhs ghcr.io/charmbracelet/vhs "$@"
# }

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/tyrel/.lmstudio/bin"
# End of LM Studio CLI section

# secrets
source "${${(%):-%x}:A:h}/.env"

echo "Oh hi 👋"

# launch herdr and start claude (cc alias) in the first agent-free pane
function hc() {
  (
    until herdr pane list >/dev/null 2>&1; do sleep 0.3; done
    p=$(herdr pane list | jq -r '.result.panes[] | select(.agent==null) | .pane_id' | head -1)
    [[ -n $p ]] && herdr pane run "$p" cc >/dev/null
  ) &!
  herdr "$@"
}

# Added by cua-driver-rs installer — see https://github.com/trycua/cua
export PATH="/Users/tyrel/.local/bin:$PATH"
