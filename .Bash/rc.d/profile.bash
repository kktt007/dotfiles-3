# vim: set ft=sh ts=2 sw=2 et:

#
# Environment
#
export EDITOR='vim'

#
# Completion
#
[ -f /etc/bash_completion ] && source /etc/bash_completion

#
# Grep 
#
export GREP_OPTIONS='--color=auto'

#
# History
#
shopt -s histappend                         # Append each(!) history entry from all terminals realtime(not after sesion ending)
shopt -s cmdhist                            # store multiline commands as 1 line
shopt -s cdspell                            # spelling error correction 
shopt -s checkwinsize                       # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
export HISTCONTROL="ignoredups"             # ignore duplicates(store command once)
export HISTCONTROL="ignoreboth"
export HISTIGNORE="&:ls:[bf]g:exit:%[0-9]"  # ignore simple commands
export HISTFILESIZE=5000                    # history file size

#
# Prompt command
#
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
export PROMPT_COMMAND="$PROMPT_COMMAND;history -a" #evaluated each time command line-prompt is printed so we hook up history appending there

#
# Prompt string
#
PS1='\[\033[1;3;12;43m\]\D{%H:%M}\[\033[0;20m\]\[\033[0;35m\] $(__git_ps1 "%s\\\" )\[\033[00m\]\[\033[01;34m\]\W\[\033[00m\]\$ '

#
# Aliases
#

# admin
alias S='sudo'
complete -cf sudo
complete -cf S

alias pm='pacman'
alias kill9='kill -9'
alias ssn='sudo shutdown -h now'

# shell
alias ..='cd ..'
alias ...='cd ../..'

alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

alias mdcd='f () { mkdir -p $1 && cd $1; }; f '
alias mkdir='mkdir -p'
alias md='mkdir'

alias ls='ls -h --color=auto'
alias l1='ls -1'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -l'

alias du='du -sh'
alias dua='\du -ah'

alias tf='tail -f '
alias less='less -R'

# bash
alias Brc='E ~/.bashrc && source ~/.bashrc'
alias Bstats='f() { history|cut -d\  -f4-5|sort|uniq -c|sort -rn|head -${1:-30}; }; f'

# editor
alias vi='vim'
alias E=$EDITOR

# git
alias G='git'
complete -o default -o nospace -F _git G # allow git-completion to work with alias either

# dotfiles
alias Gdf="G --work-tree=$HOME --git-dir=$HOME/dotfiles.git"

# grep
alias ?='\grep -i'
alias ??='? -nR'
alias ?E='f () { A=($@); A[1]=${A[1]:-./}; ?? ${A[@]} |E - ; }; f ' # grep results into editor

# rails
alias rails1='rails _1.2.6_'
alias cap1='cap _1.4.0_'
