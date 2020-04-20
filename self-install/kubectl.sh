#!/bin/bash

usage() {
	echo "$0 <version>"
}

# To get latest: https://storage.googleapis.com/kubernetes-release/release/stable.txt
#!/bin/bash
if [[ ! "$1" =~ ^[a-zA-Z0-9\.]{3,15}$ ]]; then
    echo "\"$1\" is not a valid version"
    usage
    exit -1
fi
if [[ -f ~/bin/kubectl ]]; then
	echo "~/bin/kubectl already exists"
	exit -1
fi

url=https://storage.googleapis.com/kubernetes-release/release/$1/bin/linux/amd64/kubectl

code=$(curl -o /dev/null -s -w "%{http_code}\n" $url)
if [ "$code" == "200" ];
then
	target_dir=~/bin
    curl -L $url > ${target_dir}/kubectl
    chmod +x ${target_dir}/kubectl
    kubectl version --client
else
    echo "\"$1\" does not exist, http code=$code"
    usage
    exit -1
fi


