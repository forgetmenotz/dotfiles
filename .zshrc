# Add to path
#path+=/home/user/.cargo/bin

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt inc_append_history
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59'

plugins=(history-substring-search)

# vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey -M vicmd '^[' undefined-key

function goto_start_then_insert(){
 zle vi-beginning-of-line
 zle vi-insert
}

zle -N goto_start_then_insert

# vim command mode keys
bindkey -M vicmd o vi-insert
bindkey -M vicmd j vi-backward-char
bindkey -M vicmd k vi-down-line-or-history
bindkey -M vicmd i vi-up-line-or-history
bindkey -M vicmd l vi-forward-char
bindkey -M vicmd K vi-up-line-or-history
bindkey -M vicmd I vi-down-line-or-history
bindkey -M vicmd O goto_start_then_insert

# Use vim keys in tab complete menu:
bindkey -M menuselect 'j' vi-backward-char
bindkey -M menuselect 'i' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'k' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Aliases
source ~/.aliases

# Take fzf arguments and pipe to vim
function ed {
if [ $1 ]; then 
	iscmd="$(find . | fzf --print0 -q $1)"
else
	iscmd="$(find . | fzf --print0 $1)" 
fi
[ "$?" -lt 1 ] && vim $iscmd
}

# Take fzf arguments and pipe to vim-prose
function wr {
if [ $1 ]; then 
	iscmd="$(find . | fzf --print0 -q $1)"
else
	iscmd="$(find . | fzf --print0 $1)" 
fi
[ "$?" -lt 1 ] && vim -Nu ~/.proserc $iscmd
}

# Change cursor shape for different vi modes.
function zle-keymap-select {
 if [[ ${KEYMAP} == vicmd ]] ||
 [[ $1 = 'block' ]]; then
 echo -ne '\e[1 q'
 elif [[ ${KEYMAP} == main ]] ||
 [[ ${KEYMAP} == viins ]] ||
 [[ ${KEYMAP} = '' ]] ||
 [[ $1 = 'beam' ]]; then
 echo -ne '\e[5 q'
 fi
}

zle -N zle-keymap-select
zle-line-init() {
 zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
 echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
 tmp="$(mktemp)"
 lf -last-dir-path="$tmp" "$@"
 if [ -f "$tmp" ]; then
 dir="$(cat "$tmp")"
 rm -f "$tmp"
 [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
 fi
}

bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/aliases" ] && source "$HOME/.config/aliases"
# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
