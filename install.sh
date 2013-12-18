#!/bin/bash
############################
# install.sh
# This script creates copies of the dotfiles in this directory to users' home directory
# ############################

dir=~/
echo "Copying the dotfiles in the home directory"
files="bashrc bash_profile git-completion-bash irbrc vimrc"
folders="aliases"

for file in $files; do
  echo "Moving files to appropriate locations"
  cp ~/.$file ~/
done

for folder in $folders; do
  echo "Moving folders to appropriate locations"
  cp -R ~/.$folder ~/
done
