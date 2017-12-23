#!/bin/sh
#
# (c)2015 Christian Kujau <lists@nerdbynature.de>
# Install dot files to the current working directory
#

# curl? wget? fetch?
type -p curl  > /dev/null && PROG="curl  --output"
type -p fetch > /dev/null && PROG="fetch --output"
type -p wget  > /dev/null && PROG="wget  --output-document"

if [ -z "$PROG" ]; then
	echo "No download program found. Install \"curl\", \"wget\" or \"fetch\" and try again!"
	exit 1
else
	for f in aliases bash_profile bashrc kshrc profile screenrc tmux.conf vimrc wgetrc zprofile zshrc; do
		[ -f ."$f" ] && mv ."$f" ."$f".bak.$$
		$PROG ."$f" https://raw.githubusercontent.com/ckujau/dotfiles/master/"$f"
	done
	BACKUP_FILES=$(ls -d .*.bak.* 2>/dev/null | xargs echo)
	[ -z "$BACKUP_FILES" ] || echo "Backup files can be removed with: rm $BACKUP_FILES"

	# ZSH uses .zprofile instead of .profile
	[ -e .zprofile ] || ln -s .profile .zprofile
fi
