# If user ID is greater than or equal to 1000 & if ~/bin exists and is a directory & if ~/bin is not already in your>
# then export ~/bin to your $PATH.
# ( another interesting cmd is: hash php 2> /dev/null || hash -p /usr/local/foobar/php/bin/

if [[ $UID -ge 1000 ]]; then
	if [[ -d $HOME/bin ]] && [[ -z $(echo $PATH | grep -o $HOME/bin) ]]; then
		export PATH="${PATH}:$HOME/bin"
	fi
	if [[ -d $HOME/.cargo/bin ]] && [[ -z $(echo $PATH | grep -o $HOME/.cargo/bin) ]]; then
		export PATH="${PATH}:$HOME/.cargo/bin"
	fi
	if [[ -d $HOME/.local/bin ]] && [[ -z $(echo $PATH | grep -o $HOME/.local/bin) ]]; then
		PATH="${PATH}:$HOME/.local/bin"
	fi
fi

# Default programs:
export EDITOR="nvim"
export TERMINAL="tilix"
export BROWSER="firefox"
export READER="koreader"
export FILE="lf"

# XDG compliance
export ZDOTDIR="$HOME/.config/zsh"
export WGETRC="$HOME/.config/wget/wgetrc"
export INPUTRC="$HOME/.config/inputrc"
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey

# from obscure bloody nnn "documentation"
export NNN_PLUG='z:-_|koreader $nnn'

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
