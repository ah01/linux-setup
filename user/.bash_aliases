# --- Navigation ---

# CD
alias u='cd ..'
alias ..='cd ..'
alias ~='cd ~'

# mk directory and go into it
mkd () { mkdir -p "$1" && cd "$1"; } 

# LS aliases
alias ll='ls -lhp'
alias la='ls -A'
alias l='ls -CF'

# Frequent
alias e='exit'
alias s='sudo -i'
alias ss='sudo -s'

alias i='~/.welcome-info.sh'

# Misc
json() { echo $* | python -mjson.tool; }
