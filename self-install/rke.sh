#!/bin/bash

usage() {
	echo "$0 <rke-version> [<output-dir>]
		rke-version:  See https://github.com/rancher/rke/releases
		output-dir:  Directory where rke-<rke-version> executable is written.  Default is ~/.local/bin.  Directory must exist.
"
}

if [[ -z "$1" ]]; then
	usage; exit -1;
fi

if [[ ! "$1" =~ ^[a-zA-Z0-9\.]{3,15}$ ]]; then
    echo "\"$1\" is not a valid version"
    usage; exit -1
fi

if [[ ! -z "$2" ]]; then
	target_dir=$2
	else
	target_dir=~/.local/bin
fi

if [[ ! -d "$target_dir" ]]; then
	echo "Directory $target_dir does not exist"
	usage; exit -1;
fi

rke_url=https://github.com/rancher/rke/releases/download/v$1/rke_linux-amd64
rke_exe=rke-$1

code=$(curl -o /dev/null -s -w "%{http_code}\n" $rke_url)
if [ "$code" == "302" ];
then
	target_dir=~/.local/bin
    curl -L $rke_url > ${target_dir}/$rke_exe
    chmod +x ${target_dir}/$rke_exe
else
    echo "\"$rke_url\" does not exist"
    exit -1
fi