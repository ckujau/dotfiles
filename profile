#
# ~/.profile
#
umask 0027

export TERM='xterm'
export PAGER='less'
export LESS='--ignore-case --squeeze-blank-lines --no-init --RAW-CONTROL-CHARS'
export EDITOR='vim'

# For some reason, pdksh doesn't execute ~/.kshrc when ENV is not set.
echo "${SHELL}" | grep ksh >/dev/null || [ -n "${KSH_VERSION}" ] && export ENV=${HOME}/.kshrc
