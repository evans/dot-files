set editing-mode vi
set show-mode-in-prompt on
set colored-stats on

export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export CVS_SERVER='aklog cs.cmu.edu;cvs'

alias cdProgramming="cd ~/Documents/CMU/Programming"
alias cd15122="cd ~/Documents/CMU/ImperativeComputation"
alias cd214="cd \"/Users/evans/Documents/CMU/16 Spring/15-214/ehauser\""
alias cdCMU="cd \"/Users/evans/Documents/CMU/\""

alias cdgit="cd ~/Documents/Personal/gitrepos"
alias cdafs="cd /afs/andrew.cmu.edu/usr/ehauser"
alias afssetup="kinit -f ehauser@ANDREW.CMU.EDU; \
  aklog ANDREW.CMU.EDU;"
alias p3="cd /afs/andrew.cmu.edu/usr/ehauser/private/15410/p3"
alias objdump="gobjdump"
alias ogc='open -a Google\ Chrome --args --disable-web-security'
alias pandora='/Applications/pianobar/pianobar'
alias cddate='cd $(date +%Y-%m-%d)'

alias g="git"
alias s="screen"
alias v="vim"

#alias cmake="cmake -D CMAKE_PREFIX_PATH=/opt/local/lib/cmake"
alias compile=="cmake . ; make"
export PATH=$PATH:/Users/evans/Documents/CMU/ImperativeComputation/cc0/bin
export PATH=$PATH:/opt/local/bin/
export PATH=$PATH:/opt/local/include/
export PATH=$PATH:/usr/local/
export PATH="$PATH:/usr/local/gradle/bin"
export PATH="$PATH:/usr/local/android/bin"
#/Users/evans/Documents/Personal/Programming/firefox/android/platform-tools/adb
export PATH="$PATH:/Users/evans/Documents/personal/programming/firefox/android/platform-tools"


copyToPoloSite(){
    scp $1 ehauser@linux.andrew.cmu.edu:/afs/andrew.cmu.edu/org/cmumwp
}
alias copyToPoloSite=scpPolo

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
