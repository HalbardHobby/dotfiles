
echo '😺😺😺 Hola, humano 😺😺😺'

# Set Variables


# ====== Change ZSH Options =======

# --- History options ---

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

# ===== Create Aliases ===== 

alias la='ls -A'
alias ll='ls -lAFh'
alias cat='batcat'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias rm='rm -i'
alias mv='mv -i'

# --- Git Aliases ---

alias g='git'

alias ga='git add'
alias gaa='git add --all'

alias gs='git status'
alias gr='git reset'

alias gc='git commit -v'
alias gcm='git commit -m'

# Syntax highlighting for man pages using bat
export MANPAGER="zsh -c 'col -bx | batcat -l man -p'"

# Customize Prompts
PS1='
%1~ %L %#'

RPROMPT='%*'

# Add Locations to $PATH


# Write handy functions


# ZSH Plugins


# Misc

