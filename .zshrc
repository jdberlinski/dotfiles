lsflags="--color --group-directories-first -F"

function git_branch_name() {
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]]; then
    :
  else
    echo '⎇ '$branch''
  fi
}

setopt prompt_subst

# Aliases
alias ls="ls ${lsflags}"
alias ll="ls ${lsflags} -lh"
alias la="ls ${lsflags} -lah"
alias ,="cd .."
alias v="nvim"
alias z="zathura"

alias pronto="ssh jberlin@pronto.las.iastate.edu"
alias gangotri="ssh gangotri.stat.iastate.edu -l jberlin -p 51064"

# GIT
# Do this: git config --global url.ssh://git@github.com/.insteadOf https://github.com
alias gd="git diff"
alias gs="git status 2>/dev/null"
alias gc="git commit"
alias ga="git add"
alias gl="git pull"
alias gp="git push"

# More suitable for .zshenv
EDITOR=vim

# Set the right prompt to the vcs_info message
RPROMPT='$(git_branch_name)'

PROMPT='%2~ %(?.%F{green}$.%F{red}$)%f '

# quick R building
alias rmk="R CMD build && R CMD INSTALL ."

# source my shell scripts
source ~/random/shelltools.sh

# History settings
HISTFILE=~/.history-zsh
HISTSIZE=10000
SAVEHIST=10000
setopt append_history           # allow multiple sessions to append to one history
setopt bang_hist                # treat ! special during command expansion
setopt extended_history         # Write history in :start:elasped;command format
setopt hist_expire_dups_first   # expire duplicates first when trimming history
setopt hist_find_no_dups        # When searching history, don't repeat
setopt hist_ignore_dups         # ignore duplicate entries of previous events
setopt hist_ignore_space        # prefix command with a space to skip it's recording
setopt hist_reduce_blanks       # Remove extra blanks from each command added to history
setopt hist_verify              # Don't execute immediately upon history expansion
setopt inc_append_history       # Write to history file immediately, not when shell quits
setopt share_history            # Share history among all sessions

# Tab completion
autoload -Uz compinit && compinit
setopt complete_in_word         # cd /ho/sco/tm<TAB> expands to /home/scott/tmp
setopt auto_menu                # show completion menu on succesive tab presses
setopt autocd                   # cd to a folder just by typing it's name
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&' # These "eat" the auto prior space after a tab complete

# MISC
setopt interactive_comments     # allow # comments in shell; good for copy/paste
unsetopt correct_all            # I don't care for 'suggestions' from ZSH
export BLOCK_SIZE="'1"          # Add commas to file sizes

# PATH
typeset -U path                 # keep duplicates out of the path
path+=(.)                       # append current directory to path (controversial)

# BINDKEY
bindkey -e
bindkey '\e[3~' delete-char
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey ' '  magic-space
export PATH="/home/josh/.local/bin:$PATH"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/josh/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
