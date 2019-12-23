#!/bin/sh
#
# (c)2015 Christian Kujau <lists@nerdbynature.de>
# Install dot files to the current working directory.
#

# NetBSD/ftp? FreeBSD/fetch? curl? wget? Order matters here.
type ftp   > /dev/null 2>&1 && PROG="ftp   -o"
type fetch > /dev/null 2>&1 && PROG="fetch -o"
type curl  > /dev/null 2>&1 && PROG="curl  -L --output"
type wget  > /dev/null 2>&1 && PROG="wget     --output-document"

if [ -z "${PROG}" ]; then
	echo "No download program found. Install \"ftp\", \"fetch\", \"curl\" or \"wget\" and try again!"
	exit 1
else
	for f in aliases bash_profile bashrc kshrc profile screenrc tmux.conf vimrc wgetrc zprofile zshrc; do
		[ -f .${f} ] && mv .${f} .${f}.bak.$$
		$PROG .${f} https://raw.githubusercontent.com/ckujau/dotfiles/master/${f}
	done

	BACKUP_FILES=$(ls -d .*.bak.$$ 2>/dev/null | xargs echo)
	[ -z "${BACKUP_FILES}" ] || echo "Backup files can be removed with: rm ${BACKUP_FILES}"
fi
