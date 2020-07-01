# Path to oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
fpath+=/home/josh/.local/bin

# Path to shell utilities
export UTILS="$HOME/utils/"

ZSH_THEME="minimal"

plugins=(git colored-man-pages)

source $ZSH/oh-my-zsh.sh
source $UTILS/mcd.sh
source $UTILS/marcopolo.sh

alias ll="ls -AgFh"
alias statrdc="xfreerdp /v:gs.stat.iastate.edu /from-stdin /cert-ignore /u:'jberlin' /dynamic-resolution"
alias nord="nordvpn"
alias v="vim"
