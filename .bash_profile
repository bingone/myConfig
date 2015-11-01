set -o vi
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias l='ls -a'
alias ll='ls -al'
alias lx='ls -lhBX'        #sort by extension
alias lz='ls -lhrS'        #sort by size
alias lt='ls -lhrt'        #sort by date    最常用到，ls -rt，按修改时间查看目录下文件
alias grep='grep --color'

#combine mkdir and cd
mkcd () {
      mkdir "$1"
        cd "$1"
}
