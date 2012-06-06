# fuck that you have new mail shit
unset MAILCHECK

# vi binding
set -o vi

# we want the various sbins on the path along with /usr/local/bin
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
PATH="/usr/local/bin:$PATH"

shopt -s histverify

source ~/.completion/git-completion.bash
source ~/.completion/rake.bash

# notify of bg job completion immediately
set -o notify

# source ~/.shenv now if it exists
test -r ~/.shenv &&
. ~/.shenv

# put ~/bin on PATH if you have it
test -d "$HOME/bin" &&
PATH="$HOME/bin:$PATH"

# history stuff
HISTCONTROL=ignoreboth
HISTFILESIZE=10000
HISTSIZE=10000

# Set VIM as editor
EDITOR=vim
export EDITOR

# Color LS output
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# we always pass these to ls(1)
LS_COMMON="-hBG"

# if the dircolors utility is available, set that up to
dircolors="$(type -P gdircolors dircolors | head -1)"
test -n "$dircolors" && {
    COLORS=/etc/DIR_COLORS
    test -e "/etc/DIR_COLORS.$TERM"   && COLORS="/etc/DIR_COLORS.$TERM"
    test -e "$HOME/.dircolors"        && COLORS="$HOME/.dircolors"
    test ! -e "$COLORS"               && COLORS=
    eval `$dircolors --sh $COLORS`
}
unset dircolors

test -n "$LS_COMMON" &&
alias ls="command ls $LS_COMMON --color=tty"

# ----------------------------------------------------------------------
# PROMPT
# ----------------------------------------------------------------------

RED="\[\033[0;31m\]"
BROWN="\[\033[0;33m\]"
GREY="\[\033[0;97m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
PS_CLEAR="\[\033[0m\]"
SCREEN_ESC="\[\033k\033\134\]"

if [ "$LOGNAME" = "root" ]; then
    COLOR1="${RED}"
    COLOR2="${BROWN}"
    P="#"
else
    COLOR1="${GREEN}"
    COLOR2="${BROWN}"
    P="\$"
fi

function git_branch {
  echo `git --git-dir=\$PWD/.git/ branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`
}

function git_status {
  STATUS=`git --git-dir=\$PWD/.git/ status 2> /dev/null | tail -n1`
  [[ ${STATUS} != "nothing to commit (working directory clean)" ]] && echo "*"
}

prompt_color() {
  PS1="${COLOR2}${COLOR2}\u ${COLOR1}\W${GREY}${COLOR2} ${BLUE}\$(git_branch)${RED}\$(git_status) ${PS_CLEAR}: "
  PS2="\[[33;1m\]continue \[[0m[1m\]> "
}

# Use the color prompt by default when interactive
test -n "$PS1" &&
prompt_color
