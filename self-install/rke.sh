#!/bin/bash
if [[ ! "$1" =~ ^[a-zA-Z0-9\.]{3,15}$ ]]; then
    echo "\"$1\" is not a valid version"
    exit -1
fi

code=$(curl -o /dev/null -s -w "%{http_code}\n" https://github.com/rancher/rke/releases/download/v$1/rke_linux-amd64)
if [ "$code" == "302" ];
then
	target_dir=~/.local/bin
    curl -L https://github.com/rancher/rke/releases/download/v$1/rke_linux-amd64 > ${target_dir}/rke-$1
    chmod +x ${target_dir}/rke-$1
else
    echo "\"$1\" does not exist"
    exit -1
fi