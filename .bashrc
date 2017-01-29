if [ -f ~/.bash_local ]; then
  source ~/.bash_local
fi
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

set editing-mode vi
set show-mode-in-prompt on
set colored-stats on

export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

alias ogc='open -a Google\ Chrome --args --disable-web-security'

#alias cmake="cmake -D CMAKE_PREFIX_PATH=/opt/local/lib/cmake"
alias compile=="cmake . ; make"
export PATH=$PATH:/opt/local/bin/
export PATH=$PATH:/opt/local/include/
export PATH=$PATH:/usr/local/
export PATH="$PATH:/usr/local/gradle/bin"
export PATH="$PATH:/usr/local/android/bin"

#Color variables

export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

#Set directory of shell on ranger exit
ranger() {
    command ranger --fail-unless-cd $@ &&
    cd "$(grep \^\' ~/.config/ranger/bookmarks | cut -b3-)"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export HISTCONTROL=ignorespace

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
