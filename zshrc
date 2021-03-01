
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

setopt promptsubst

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
alias gb='git branch'
alias gp='git push'

alias gc='git commit -v'
alias gcm='git commit -m'

# --- Navigation Aliases ---

alias ..='cd ..'
alias ~='cd ~'
alias dl='cd ~/Downloads'
alias dc='cd ~/Documents'

# Syntax highlighting for man pages using bat
export MANPAGER="zsh -c 'col -bx | batcat -l man -p'"

# Customize Prompts

PROMPT='%{%f%b%k%}$(build_prompt) '
RPROMPT='%*'

# Add Locations to $PATH


# Write handy functions


# ===== ZSH Plugins =====

source ~/.zsh/themes/agnoster.zsh-theme

# Misc

