# alias
alias al='alias'

# CMD
alias cdw='cd git/wonderful_editor/'
alias cl='clear'
alias ll='ls -al'
alias p='pwd'


# git
alias ga='git add .'
alias gd='git diff'
alias gs='git s'
alias gc='git commit -m'
alias gr='git reset'
alias gb='git branch'
alias gp='git push origin'

alias gch='git checkout'
alias gcm='git checkout main'
alias gcf='git checkout feature'
alias gbn='git checkout -b'

alias gfe='git fetch origin main'
alias gpul='git pull origin main'

# rails
alias ber='bundle exec rails routes'
alias berg='bundle exec rails routes | grep article'
alias be='bundle exec'
alias bec='bundle exec rails c'
alias bes='bundle exec rails s'

# rubocop
alias rb='bundle exec rubocop -a'

# Rspec
alias rs='bundle exec rspec'
alias rsf='bundle exec rspec spec/requests/api/v1/articles_spec.rb --tag focus'

# docker
alias dcu='docker-compose up -d'
alias dcs='docker-compose stop'
alias dca='docker-compose ps -a'

# rbenv
eval "$(rbenv init -)"

# nodenv
eval "$(nodenv init -)"
