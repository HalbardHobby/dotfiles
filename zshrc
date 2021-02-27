
echo '😺😺😺 Hola, humano 😺😺😺'

# Set Variables

# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

# ====== Change ZSH Options =======

# --- History options ---

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

# Create Aliases

alias lah='ls -lAFh'
alias la='ls -a'
alias cat='batcat'

# Customize Prompts
PROMPT='
%1~ %L %#'

RPROMPT='%*'

# Add Locations to $PATH


# Write handy functions


# ZSH Plugins


# Misc



