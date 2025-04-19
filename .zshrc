# ---- START bash setting copy ----
function join_by { local IFS="$1"; shift; echo "$*"; }
function _ps1_git_username {
  local git_users_array=`git config --global --get-all user.name`
  git_users=`join_by , $git_users_array`
  # test "$git_users" == 'KazusaNakagawa' && echo "🐳" && return
  # test "$git_users" && echo "$git_users" && return
echo "No Git User"
}
# PS1 is the variable for the prompt you see everytime you hit enter
git_prompt_script=/usr/local/etc/bash_completion.d/git-prompt.sh
if [ -s $git_prompt_script ]; then
# if git-prompt is installed, use it (ie. to install it use:
# `brew install git`)
source $git_prompt_script
# export GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='\[\e[0;31m\]\W\[\e[0;32m\] ($(_ps1_git_username "(%s)")$(__git_ps1 ":%s")) \[\e[0m\]:$ '
else
# otherwise omit git from the prompt
# export PS1="$ColorRed\W$ColorReset :$ "
fi
# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex

# Load git completions
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
test -s $git_completion_script && source $git_completion_script
# A more colorful prompt
# \[\e[0m\] resets the color to default color
ColorReset='\[\e[0m\]'
# \e[0;31m\ sets the color to red
ColorRed='\[\e[0;31m\]'
# \e[0;32m\ sets the color to green
ColorGreen='\[\e[0;32m\]'

# rbenv 
eval "$(rbenv init -)"

# ---- END bash setting copy ----

# PROMPT='%{${fg[cyan]}%} $n %{${reset_color}%}'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# alias -----------------------------------------
alias al='alias'

# CMD
alias cdw='cd git/wonderful_editor/'
alias ll='ls -al'
alias p='pwd'

# git
alias ga='git add'
alias gd='git diff'
alias gds='git diff --staged'
alias gs='git status'
alias gc='git commit -m'
alias gr='git reset'
alias gb='git branch'
alias gp='git push origin feature'

alias gch='git checkout'
alias gcm='git checkout main'
alias gcf='git checkout feature'
alias gbn='git checkout -b'

# rails
alias ber='bundle exec rails routes'
alias berg='bundle exec rails routes  | grep article'
alias be='bundle exec'
alias bec='bundle exec rails c'
alias bes='bundle exec rails s'

# rubocop
alias rb='bundle exec rubocop -a'

# Rspec
alias rs='bundle exec rspec'
alias rsf='bundle exec rspec spec/requests/api/v1/articles_spec.rb --tag focus'

# docker
alias dcu='docker-compose up'
alias dcs='docker-compose stop'
alias dca='docker-compose ps -a'
alias docker-purge='docker stop $(docker ps -q) && docker rmi $(docker images -q) -f'

# alias done -------------------------------------

# peco start -------------------------------------

# 過去に実行したコマンドを選択。ctrl-rにバインド
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# search a destination from cdr list
function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  peco --query "$LBUFFER"
}


### 過去に移動したことのあるディレクトリを選択。ctrl-uにバインド
function peco-cdr() {
  local destination="$(peco-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N peco-cdr
bindkey '^u' peco-cdr


# ブランチを簡単切り替え。git checkout lbで実行できる
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'


# dockerコンテナに入る。deで実行できる
alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'
# peco doen --------------------------------------


# path view
export PS1="%n %~ \$ "

# rbenv
eval "$(rbenv init -)"

# nodenv
eval "$(nodenv init -)"
