#!/bin/bash

# Pre config
ABSOLUTE_PATH="$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

# Load config
. $ABSOLUTE_PATH/hooks/config.sh

if [ -z $REPO_DIR ]; then
	echo "Please provide repository directory"
	echo "Example: REPO_DIR=/var/www/my_repo ./update.sh"
	exit
fi

for file in $(ls $ABSOLUTE_PATH/hooks/); do
	rm -rf $REPO_DIR/.git/hooks/$file
	ln -s $GIT_GLOBAL_DIR/hooks/$file $REPO_DIR/.git/hooks/$file
done

