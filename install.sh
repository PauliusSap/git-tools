#!/bin/bash

# Pre config
ABSOLUTE_PATH="$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"

# Load config
. $ABSOLUTE_PATH/hooks/config.sh


GIT_GLOBAL_HOOKS_PATH=$GIT_GLOBAL_DIR/hooks
mkdir -p $GIT_GLOBAL_DIR/hooks
git config --global init.templatedir $GIT_GLOBAL_DIR

for file in $(ls $ABSOLUTE_PATH/hooks/); do
	if [[ ! -L "$GIT_GLOBAL_HOOKS_PATH/$file" ]]; then
		ln -s $ABSOLUTE_PATH/hooks/$file $GIT_GLOBAL_HOOKS_PATH/$file
		chmod a+x $GIT_GLOBAL_HOOKS_PATH/$file
	fi
done

