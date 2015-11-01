set -o vi
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias l='ls -CFG' #CFG代表字段格式显示 文件项目上加标示符 禁止显示组群信息
alias ll='ls -al'
alias lx='ls -lhBX'        #sort by extension
alias lz='ls -lhrS'        #sort by size
alias lt='ls -lhrt'        #sort by date    最常用到，ls -rt，按修改时间查看目录下文件
alias grep='grep --color'

#combine mkdir alias's
alias osu="open -a Sublime\ Text\ 2"
alias prof="subl ~/.bash_profile"
alias reprof=". ~/.bash_profile"

# Navigational alias's
alias pdf="cd ~/Documents/pdfs"
alias de="cd ~/Desktop"
alias ds="cd ~/Documents"
alias c="cd ~/Documents/cp"
alias snip="cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/"

# Shortcut commands
alias py="python"
alias osu="open -a Sublime\ Text\ 2"
alias vlc="open -a VLC"
alias nd="node debug"

# Github commands
alias gb="git branch"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gl="git log"
alias glo="git log --pretty=oneline"
alias glu="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias gh="git checkout"
alias gt="git tag"
alias grs="git reset"
alias grv="git revert"
alias gm="git merge"
alias gpom="git push origin master"
alias gpum="git pull origin master"
alias gd="git diff"
alias gpo="git push origin"
alias gob="git checkout -b"

# Docker
alias bd="boot2docker"
alias bds="boot2docker start"
alias dk="docker"
alias dkr="docker run"

docker-ip() {
		  boot2docker ip 2> /dev/null
}

# Vagrant
alias vg="vagrant"

# Helper functions

# combine mkdir and cd
mkcd () {
		  mkdir "$1"
			    cd "$1"
}

# combine touch and osu
tosu () {
		  touch "$1"
			    osu "$1"
}
mkcd () {
      mkdir "$1"
        cd "$1"
}

