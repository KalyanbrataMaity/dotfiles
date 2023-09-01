#!/bin/bash

create_symlinks() {
    # Get tge directory in which this script lives.
    script_dir="$(cd "$(dirname "$0")" && pwd)"
    echo "The script is located in: $script_dir"

    # Get a list of all files in this directory that start with a dot.
    files=$(find "$script_dir" -maxdepth 1 -type f -name ".*")
    echo "Files starting with a dot in the directory:"
    echo "$files"

    # Create a symbolic link to each file in the home directory.
    for file in $files; do 
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name 
    done
    
}

create_symlinks

echo "Initializing conda for zsh."
conda init zsh

echo "Initializing fonts."
FONT_DIR="$HOME/.fonts"
if [ -d "$FONT_DIR" ]; then
    echo "Removing existing directory: $FONT_DIR"
    rm -rf "$FONT_DIR"
fi 
echo "Clonning the powerline fonts to $FONT_DIR"
git clone https://github.com/powerline/fonts.git $FONT_DIR --depth=1
cd $FONT_DIR
./install.sh

echo "Setting up the Spaceship theme."
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
if [ -d "$ZSH_CUSTOM" ]; then
    echo "Removing existing directory: $ZSH_CUSTOM"
    rm -rf "$ZSH_CUSTOM"
fi 
echo "Clonning the powerline fonts to $ZSH_CUSTOM"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
