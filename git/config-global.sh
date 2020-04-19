#!/bin/bash

usage() {
	echo "$0 <user> <e-mail>"
}

if [[ -z $1 ]]; then
	usage; exit -1
fi

if [[ -z $2 ]]; then
	usage; exit -1
fi

git config --global user.name "$1"
git config --global user.email "$2"