echo -ne "\033]0; You have connected to [SERVER NAME]\a"

# Bash Aliases
#-----------------------------------------------------------


function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u:"
    local __cur_location="\[\033[01;34m\]\W"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __last_color="\[\033[00m\]:"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt


# Alias Bash
#----------------

alias editbash='nano ~/.bashrc'
alias sourcebash='source ~/.bashrc'

# Docker
alias dockerup='docker-compose up -d --remove-orphans && docker-compose ps && dtop'
alias dtop='docker ps -q | xargs  docker stats --no-stream'
alias logd='docker logs -tf --tail="200"'

# Rar
alias unrar-find='unrar e -r -o- *.rar ./'


# Git
#------------------
git config --global core.editor "nano"
## Add github ssh
eval $(ssh-agent -s)

alias ssh-github='ssh-add ~/.ssh/github/github'
alias ssh-gitea='ssh-add ~/.ssh/gitea/gitea'

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

alias which-branch="git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'"
