alias cddate='cd $(date +%Y-%m-%d)'

alias g="git"
if [[ -d "/usr/local/bin/screen" ]]
then
  alias s="/usr/local/bin/screen"
elif [[ -d "/opt/local/bin/screen" ]]
then
  alias s="/opt/local/bin/screen"
else
  alias s="screen"
fi
alias v="vim"
# long with human readable size and all files
alias ll="ls -lhA"

# Monitor logs
# alias syslog='sudo tail -100f /var/log/syslog'
# alias messages='sudo tail -100f /var/log/messages'
