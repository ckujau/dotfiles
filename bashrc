#
# ~/.bashrc
#
export HISTFILE="${HOME}/.bash_history"
export HISTTIMEFORMAT="%F %T "
export HISTSIZE=50000
export HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
export PROMPT_COMMAND="history -a"

if [ "${LOGNAME}" = "root" ]; then
	export PS1='\h# '
	alias la='ls -lha'
else
	export PS1='\u@\h$ '
	alias la='ls -lh'
fi

# > Enable bash-completion only if not in POSIX mode
# > https://www.gnu.org/software/bash/manual/html_node/Bash-POSIX-Mode.html
if [ -f /usr/share/bash-completion/bash_completion ] && \
	! shopt -oq posix && \
	[ -z "${BASH_COMPLETION_VERSINFO}" ]; then
	. /usr/share/bash-completion/bash_completion
fi

[ -r "${HOME}/.aliases"     ] && . "${HOME}/.aliases"
[ -r "${HOME}/.shell.local" ] && . "${HOME}/.shell.local"
