# COLORS
export BLACK='\033[0;30m'
export DARK_GRAY='\033[1;30m'
export RED='\033[0;31m'
export LIGHT_RED='\033[1;31m'
export GREEN='\033[0;32m'
export LIGHT_GREEN='\033[1;32m'
export ORANGE='\033[0;33m'
export YELLOW='\033[1;33m'
export BLUE='\033[0;34m'
export LIGHT_BLUE='\033[1;34m'
export PURPLE='\033[0;35m'
export LIGHT_PURPLE='\033[1;35m'
export CYAN='\033[0;36m'
export LIGHT_CYAN='\033[1;36m'
export LIGHT_GRAY='\033[0;37m'
export WHITE='\033[1;37m'
export NC='\033[0m' # No Color
export RED='\033[0;31m'

alias echo="echo -e" # So echo uses colors and backslashes escape


# GENERAL PURPOSE
alias cls="clear"
alias clr='clear'

alias m="less -n"



alias whelp='echo | alias | sed "s/=/	/" | sed "s/alias/${LIGHT_GREEN}/"'

# GREP
## Colorize the grep command output for ease of use (good for log files)##
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias grp="grep"
alias rgrep='grep -r'
alias hig="history | grep"


# FILE MANAGEMENT
## Colorize the ls output ##
alias ls='ls -a --color=auto'
alias l='ls'
alias dir='l -d /*'
alias ll='ls -Xla --color'

alias ff="find . -type f -name"	#find file
alias mkdir="mkdir -pv"
alias rmdir="rm -rf -v"

alias rename="mv $1 $2"
alias mv="mv -iv"
alias cp="cp -p"

alias rmde="find . -type d -empty -exec rmdir {} \;" # Remove empty dirs

alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'" 


# SHUTDOWN
alias shdo="shutdown -s"
alias shdc="shutdown -a"
alias shda="shutdown -a"
alias x="exit"




# GIT ALIASES
alias echoPullWarning='echo ""; echo -e "${RED}*********************************************"; echo -e "${RED}   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "${RED}*********************************************\e[1;37m"'

alias gs='echoPullWarning; git status; echoPullWarning'      			# Git Status
alias gss='echoPullWarning; git status -s; echoPullWarning'  			# Git Status
alias gl="git log --oneline --all --graph --decorate  $*"    			
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'		# Pretty git log
alias gcm='git commit -m'
alias gad='git add -A'
alias gco='git checkout'


# JAVA HOME
export JAVA_HOME="C:\Program Files\Java\jdk1.7.0_71"



## PROGRAMS

alias opd="explorer ."
alias op="start"
alias gg='/C/terminal/cmd-scripts/bash/gg.sh'
alias ggi="/C/terminal/cmd-scripts/bash/ggi.sh"
alias q="/C/terminal/cmd-scripts/bash/q.sh"

#ev
#gmail

#fb
alias fb="gg https://facebook.com"

#meteo


alias gp6='/C/"Program Files (x86)"/Guitar Pro 6/GuitarPro.exe&'
alias qb='/C/"Program Files (x86)"/qBittorrent/qbittorrent.exe&'
alias qt='/G/Dev/Qt/Tools/QtCreator/bin/qtcreator.exe&'
# CELL
alias tocell="cp $1  /h/Music/New/"





















# INITIALIZATION
alias winit="source $HOME/.bashrc"
echo "${LIGHT_GREEN}WINIT DONE"


