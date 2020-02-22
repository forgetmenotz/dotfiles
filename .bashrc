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

bind '"C-u":"next-screen-line"'

#if [ -f `which powerline-daemon` ]; then
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr//lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
#fi
