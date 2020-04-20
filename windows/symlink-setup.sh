#!/bin/bash
# When Running WSL on Windows, create symlinks to the kubectl and docker commands in windows.  Run this from a folder on WSL Path.
sudo ln -s "$(which kubectl.exe)" kubectl
sudo ln -s "$(which docker.exe)" docker
sudo ln -s "$(which helm.exe)" helm