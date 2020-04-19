#!/bin/bash
rm -fr target
mkdir target

function install_awscli2() {
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
}

(cd target && install_awscli2)
rm -fr target

aws --version