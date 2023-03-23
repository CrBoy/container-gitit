#!/usr/bin/env bash
set -eu

print_default_config () {
	echo "address: 0.0.0.0"
	echo "port: 5001"
	echo "wiki-title: Wiki"
	echo "repository-path: data"
	echo "static-dir: site/static"
	echo "templates-dir: site/templates"
	echo "log-file: gitit.log"
	echo "log-level: WARNING"
	echo "user-file: gitit-users"
	echo "require-authentication: modify"
	echo "front-page: Front Page"
	echo "no-delete: Front Page, Help"
	echo "no-edit: Help"
	echo "session-timeout: 60"
	echo "max-upload-size: 100K"
	echo "max-page-size: 100K"
}

make_git () {
	if [ ! -e $1 ]; then
		mkdir $1
	fi

	if [ -d $1 ]; then
		local is_git_work_tree=$(git -C $1 rev-parse --is-inside-work-tree 2>/dev/null)
		if [ -z $is_git_work_tree ]; then
			git init $1
		fi
	else
		exit 1
	fi
}

CONFIG_FILE=gitit.conf
if [ ! -e $CONFIG_FILE ]; then
	print_default_config > $CONFIG_FILE
fi

make_git data

# # first arg is `-f` or `--some-option`
# if [ "${1#-}" != "$1" ]; then
#         set -- gitit "$@"
# fi

exec "$@"
