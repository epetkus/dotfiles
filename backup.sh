#!/bin/bash

# Paths of the original dotfiles
ALACRITTY_FILE=~/.alacritty.toml
NVIM_CONFIG_FILE=~/.config/nvim/init.lua

# Directory where the dotfiles repository is located
DOTFILES_DIR=~/code/personal/dotfiles

# Backup function
backup_file() {
    cp $1 $DOTFILES_DIR
    echo "Backed up $1 to $DOTFILES_DIR"
}

# Backup files
backup_file $ALACRITTY_FILE
backup_file $NVIM_CONFIG_FILE

# Move to dotfiles directory
cd $DOTFILES_DIR

# Git add, commit, and push
git add .
git commit -m "Updated dotfiles backup"
git push

