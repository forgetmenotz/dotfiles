function confedit()
{
	if [ $1 = "i3" ]; then vim ~/.config/i3/config
	elif [ $1 = "keyl" ]; then vim ~/mine/backup/xmodmap/decentkeys
	elif [ $1 = "keyr" ]; then vim ~/mine/backup/xmodmap/funnykeys
	elif [ $1 = "comp" ]; then vim ~/mine/.config/compton/.compton
	elif [ $1 = "basha" ]; then vim ~/.bash_aliases
	elif [ $1 = "bash" ]; then vim ~/.bashrc
	elif [ $1 = "bashi" ]; then vim ~/.inputrc
	elif [ $1 = "vim" ]; then vim ~/.vimrc
	elif [ $1 = "tmux" ]; then vim ~/.tmux.conf
	elif [ $1 = "todo" ]; then vim ~/mine/notes/todo
	elif [ $1 = "zsh" ]; then vim ~/.zshrc
	else echo "no config selected"
	fi
}

alias cnf='confedit $1'
