#| File : ~/.bash_aliases
#| Author : Nicolas Delebecque
#| Source : https://github.com/nicodel/dotFiles
#| Licence : WTFPL
#|
#|

# useful shortcuts
alias ll='ls -al'
alias maj='sudo apt-get update && sudo apt-get upgrade'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# getting 256 colors support in terminal
export TERM="xterm-256color"

export PATH=$PATH:/opt/android-studio/bin:/home/nicodel/Android/Sdk/platform-tools/:/home/nicodel/Android/Sdk/tools/
