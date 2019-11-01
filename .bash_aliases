
function confedit()
{
	if [ $1 = "i3" ]; then vim ~/.config/i3/config
	elif [ $1 = "keyl" ]; then vim ~/mine/backup/xmodmap/decentkeys
	elif [ $1 = "keyr" ]; then vim ~/mine/backup/xmodmap/funnykeys
	elif [ $1 = "compton" ]; then vim ~/mine/.config/compton/.compton
	else echo "no config selected"
	fi
}

function execkeys()
{
	if [ -f ~/mine/backup/xmodmap/$1 ]; then
		cp ~/mine/backup/xmodmap/$1 ~/.Xmodmap
		printf "loading $1 config...\n"
		setxkbmap gb
		xmodmap ~/.Xmodmap
	else
		printf "no config found.\n"
	fi
}

alias dotfiles='/usr/bin/git --git-dir=$HOME/mine/dotfiles --work-tree=$HOME'
alias cnf='confedit $1'
alias keyc='execkeys $1'
