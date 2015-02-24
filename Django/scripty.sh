#!/bin/bash=
verify_python_setup(){
	echo "VERIFY PYTHON IS INSTALLED AND REPO IS ORGANIZED"
	source Python/scripty.sh init
}

installation(){
	echo "INSTALL DJANGO"
	pip install django
}

init(){
	verify_python_setup
	installation
}

init_psql(){
	echo "INSTALL PSYCOPG2"
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
