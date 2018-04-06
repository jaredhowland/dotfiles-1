#!/bin/sh

# TODO - add support for -f and --force
link () {
	echo "This utility will symlink the files in this repo to the home directory"
	echo "Proceed? (y/n)"
	read resp
	# TODO - regex here?
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		for file in $( ls -A | grep -vE '\.exclude*|\.git|.*.md' ) ; do
			ln -sv "$PWD/$file" "$HOME"
		done
		echo "Bootstrapping complete"
	else
		echo "Bootstraping cancelled by user"
		return 1
	fi
}

link