#
# ~/.kshrc
#
export HISTFILE="$HOME"/.ksh_history
export HISTSIZE=10000
export HOSTNAME=$(hostname | awk -F\. '{print $1}')	# hostname -s is not portable

if [ "$USER" = "root" ]; then
	export PS1="${HOSTNAME}# "
	alias la='ls -lha'
else
	export PS1="${USER}@${HOSTNAME}$ "
	alias la='ls -lh'
fi

set -o emacs						# Try 'vi' for a change :-)

if [ -f "$HOME"/.kshrc.local ]; then
	. "$HOME"/.kshrc.local
fi
