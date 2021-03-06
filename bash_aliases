#| File : ~/.bash_aliases
#| Author : Nicolas Delebecque
#| Source : https://github.com/nicodel/dotFiles
#| Licence : WTFPL
#|
#|

# useful shortcuts
alias ll='ls -al'
alias maj='sudo apt-get update && sudo apt-get upgrade' # && /home/nicodel/fix_phantomjs.sh'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

#alias python="python3"

# Set Git language to English
#alias git='LANG=en_US git'
#alias git='LANG=en_US git'

# getting 256 colors support in terminal
export TERM="xterm-256color"

export PATH=$PATH:/usr/bin/nodejs:/home/nicodel/.npm-global/bin:/home/nicodel/.local/bin
