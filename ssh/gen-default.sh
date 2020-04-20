#!/bin/bash

usage() {
	echo "$0 <email-address>"
}

if [[ -z "$1" ]]; then
	usage; exit -1
fi

ssh-keygen -t rsa -b 4096 -C "$1"