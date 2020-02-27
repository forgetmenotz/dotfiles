#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ -f ~/.aliases ]; then
	source ~/.aliases
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
 source /etc/profile.d/vte.sh
fi

export $VISUAL="vim"

# Go to parent directory.
export FFF_KEY_PARENT1="j"
# Scroll up/down.
export FFF_KEY_SCROLL_DOWN1="k"
export FFF_KEY_SCROLL_UP1="i"
export FFF_LS_COLORS=0
# Directory color [0-9]
export FFF_COL1=1
# Status background color [0-9]
export FFF_COL2=5
# Selection color [0-9] (copied/moved files)
export FFF_COL3=6

bind '"C-u":"next-screen-line"'

#if [ -f `which powerline-daemon` ]; then
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr//lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
#fi
