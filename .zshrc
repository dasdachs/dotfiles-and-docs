# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZSH/oh-my-zsh.sh

plugins=(
  git
  zsh-autosuggestions
  nvm
)


# cd Path
zstyle ':completion:*:complete:(cd|pushd):*' tag-order 'local-directories named-directories'
cdpath=($HOME/projects/work $HOME/projects/dev)

# Editor
export EDITOR=nvim

# https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo#22043
alias sudo='sudo '
# Alias
alias vim=nvim
alias grep=rg
alias find=fd
alias cat=bat
alias k=kubectl
alias pbcopy=wl-copy
alias pbpaste=wl-paste
alias stow=stow --ignore=".gitignore"

# asdf
export PATH="$HOME/.asdf/shims:$PATH"

# Go
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

# Local
export PATH=$PATH:$HOME/.local/bin

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rust
source $HOME/.cargo/env 

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# pyenv
export PYENV_ROOT=/home/janis/.pyenv
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# k8s
export KUBECONFIG=/home/janis/.kube/config

# Redis on fedora
alias redis-cli=valkey-cli

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

