#!/bin/bash

create_git_files(){
	touch README.md
	touch .gitignore
}

activate_virtualenv(){
	pip install virtualenv
	virtualenv venv
	. venv/bin/activate
}

init(){
	create_git_files
	activate_virtualenv
}

kill_virtual(){
	deactivate
	rm -rf venv
}

if [ "$1" = "init" ]; then
	init
elif [ "$1" = "kill" ]; then
	kill_virtual
fi
