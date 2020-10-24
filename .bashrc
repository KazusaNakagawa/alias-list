# alias
alias al='alias'

# CMD
alias cdw='cd git/wonderful_editor/'
alias ll='ls -al'
alias p='pwd'


# git
alias a='git add .'
alias d='git diff'
alias s='git s'
alias c='git commit -m'
alias r='git reset'
alias b='git branch'

alias ch='git checkout'
alias cm='git checkout main'
alias cf='git checkout feature'
alias bn='git checkout -b'

# rails
alias brg='bundle exec rails routes  | grep article'
alias br='bundle exec rails routes'

# rubocop
alias rsf='bundle exec rspec spec/requests/api/v1/articles_spec.rb --tag focus'

# docker
alias dcu='docker-compose up -d'
alias dcs='docker-compose stop'
alias dca='docker-compose ps -a'
