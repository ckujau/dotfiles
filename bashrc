#
# ~/.bashrc
#
export HISTFILE="${HOME}/.bash_history"
export HISTTIMEFORMAT="%F %T "
export HISTSIZE=50000
export HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
shopt -s checkwinsize
export COLUMNS				# Should be set to 'tput cols'
export PROMPT_COMMAND="history -a"

if [ "${LOGNAME}" = "root" ]; then
	export PS1='\h# '
	alias la='ls -lha'
else
	export PS1='\u@\h$ '
	alias la='ls -lh'
fi

[ -r "${HOME}/.aliases"     ] && . "${HOME}/.aliases"
[ -r "${HOME}/.shell.local" ] && . "${HOME}/.shell.local"
