# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/evans/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="gnzh"
ZSH_THEME="philips"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi


###########################################
#
# Modified from :
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/gnzh.zsh-theme
#
###########################################

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{green}%n%f'
  PR_USER_OP='%F{green}%#%f'
  PR_PROMPT='%f➤ %f'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%F{green}%M%f' # no SSH
fi

local return_code="%(?..%F{red}%? ↵%f)"

local user_host="${PR_USER}%F{cyan}@${PR_HOST}"
local current_dir="%B%F{blue}%~%f%b"
local git_branch='$(git_prompt_info)'

NORMAL_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
INSERT_PROMPT="%{$fg_bold[green]%} [% INSERT]%  %{$reset_color%}"

function zle-line-init zle-keymap-select {
  VIM_PROMPT="${${KEYMAP/vicmd/$NORMAL_PROMPT}/(main|viins)/$INSERT_PROMPT}"

  PROMPT="╭─${user_host} ${current_dir} ${git_branch}
╰─${VIM_PROMPT} ${PR_PROMPT} "
  RPROMPT="${return_code}"

  zle reset-prompt
}
zle -N zle-keymap-select
zle -N zle-line-init


PROMPT="╭─${user_host} ${current_dir} ${git_branch}
╰─${VIM_PROMPT} ${PR_PROMPT} "
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"

#reduce error timeout
export KEYTIMEOUT=1

export PATH=$PATH:/opt/local/bin/
export PATH=$PATH:/opt/local/include/

export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:/usr/local/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

#enable gpg passphrase entry
GPG_TTY=$(tty)
export GPG_TTY

# Vi mode
bindkey -v

#Reverse search
bindkey '^R' history-incremental-search-backward

unsetopt HIST_VERIFY

# OPAM configuration
. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# https://github.com/denysdovhan/spaceship-prompt/issues/91
bindkey "^?" backward-delete-char

export EDITOR=vim

# For monorepo https://direnv.net/
eval "$(direnv hook zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/evans/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/evans/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/evans/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/evans/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
