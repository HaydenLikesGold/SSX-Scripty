#!/bin/bash=

verify_python_setup(){
	echo -e "\033[32mVERIFY PYTHON IS INSTALLED AND REPO IS ORGANIZED\033[0m"
	source Python/scripty.sh init
}

installation(){
	echo "\033[32mINSTALL DJANGO\033[0m"
	pip install django
}

init(){
	verify_python_setup
	installation
}

init_psql(){
	echo "\033[32mINSTALL PSYCOPG2\033[0m"
	pip install psycopg2
}

if [ "$1" = "init" ]; then
	init
	if [ "$2" = "with" ]; then
		if [ "$3" = "psql" ]; then
			init_psql
		fi
	fi
	name=$(echo "${PWD##*/}" | sed 'y/-/_/')
	django-admin.py startproject $name
fi
