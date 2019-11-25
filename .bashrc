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

bind '"C-u":"next-screen-line"'

# If user ID is greater than or equal to 1000 & if ~/bin exists and is a directory & if ~/bin is not already in your $PATH
# then export ~/bin to your $PATH.
# ( another interesting cmd is: hash php 2> /dev/null || hash -p /usr/local/foobar/php/bin/php php 2> /dev/null )
if [[ $UID -ge 1000 && -d $HOME/bin && -z $(echo $PATH | grep -o $HOME/bin) ]]
then
 export PATH="${PATH}:$HOME/bin"
fi
if [[ $UID -ge 1000 && -d $HOME/.cargo/bin && -z $(echo $PATH | grep -o $HOME/.cargo/bin) ]]
then
 export PATH="${PATH}:$HOME/.cargo/bin"
fi
if [[ $UID -ge 1000 && -d $HOME/.local/bin && -z $(echo $PATH | grep -o $HOME/.local/bin) ]]
then
 export PATH="${PATH}:$HOME/.local/bin"
fi



#if [ -f `which powerline-daemon` ]; then
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr//lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
#fi
