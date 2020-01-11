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
alias vi="vim"
# long with human readable size and all files
alias ll="ls -lhA"

# Monitor logs
# alias syslog='sudo tail -100f /var/log/syslog'
# alias messages='sudo tail -100f /var/log/messages'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias gs="g s"

alias ocamldebug="rlwrap ocamldebug"
alias ocaml="rlwrap ocaml"

alias gdb="sudo rlwrap --history-filename=$HOME/.${USER}_gdb_command_history gdb -x /Users/evans/.gdbinit"


alias cp-packages='rm -r @apollo/federation   ; ln -s /Users/evans/Documents/work/meteor/dev/apollo/server/packages/apollo-federation @apollo/federation ;\
rm -r @apollo/gateway      ; ln -s /Users/evans/Documents/work/meteor/dev/apollo/server/packages/apollo-gateway @apollo/gateway ;\
rm -r apollo-env           ; ln -s /Users/evans/Documents/work/meteor/dev/apollo/tooling/packages/apollo-env ;\
rm -r apollo-graphql       ; ln -s /Users/evans/Documents/work/meteor/dev/apollo/tooling/packages/apollo-graphql ;\
rm -r apollo-server-core   ; ln -s /Users/evans/Documents/work/meteor/dev/apollo/server/packages/apollo-server-core ;\
rm -r apollo-server-env    ; ln -s /Users/evans/Documents/work/meteor/dev/apollo/server/packages/apollo-server-env ;\
rm -r apollo-server-express; ln -s /Users/evans/Documents/work/meteor/dev/apollo/server/packages/apollo-server-express ;\
rm -r graphql              ; ln -s /Users/evans/Documents/work/meteor/dev/apollo/server/node_modules/graphql'
