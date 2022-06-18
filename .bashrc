#
# ~/.bashrc
#

[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# set -o vi

# Set Editor

export VISUAL=nvim;
export EDITOR=nvim;

# Aliases

. ~/.aliases

# Run scripts

export PATH="$HOME/Scripts:$PATH"

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# Run

fortune ~/fortunes/omk | cowsay

# Theme.sh

if command -v theme.sh > /dev/null; then
	[ -e ~/.theme_history ] && theme.sh "$(theme.sh -l|tail -n1)"

	# Optional

	#Binds C-o to the previously active theme.
	bind -x '"\C-o":"theme.sh $(theme.sh -l|tail -n2|head -n1)"'

	alias th='theme.sh -i'

	# Interactively load a light theme
	alias thl='theme.sh --light -i'

	# Interactively load a dark theme
	alias thd='theme.sh --dark -i'
fi

shopt -s autocd

source /usr/share/doc/pkgfile/command-not-found.bash

[[ ${BLE_VERSION-} ]] && ble-attach
