# fuck that you have new mail shit
unset MAILCHECK

# we want the various sbins on the path along with /usr/local/bin
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
PATH="/usr/local/bin:$PATH"

shopt -s histverify

source ~/.completion/git-completion.bash

# notify of bg job completion immediately
set -o notify

# source ~/.shenv now if it exists
test -r ~/.shenv &&
. ~/.shenv

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

# ----------------------------------------------------------------------
# PROMPT
# ----------------------------------------------------------------------

RED="\[\033[0;31m\]"
BROWN="\[\033[0;33m\]"
GREY="\[\033[0;97m\]"
BLUE="\[\033[0;33m\]"
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

prompt_simple() {
    unset PROMPT_COMMAND
    PS1="[\u@\h:\w]\$ "
    PS2="> "
}

prompt_compact() {
    unset PROMPT_COMMAND
    PS1="${COLOR1}${P}${PS_CLEAR} "
    PS2="> "
}

prompt_color() {
  PS1="${COLOR2}${COLOR2}\u ${COLOR1}\W${GREY}${COLOR2} $(__git_ps1)${PS_CLEAR}: "
  PS2="\[[33;1m\]continue \[[0m[1m\]> "
}

# Use the color prompt by default when interactive
test -n "$PS1" &&
prompt_color
