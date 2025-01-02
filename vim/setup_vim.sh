#!/bin/bash

# Common functions for all scripts
check_and_install() {
    local package=$1
    if ! command -v "$package" &> /dev/null; then
        echo "$package is not installed. Installing..."
        if command -v apt &> /dev/null; then
            sudo apt install -y "$package"
        elif command -v pacman &> /dev/null; then
            sudo pacman -S --noconfirm "$package"
        elif command -v dnf &> /dev/null; then
            sudo dnf install -y "$package"
        else
            echo "Unable to detect package manager. Please install $package manually."
            exit 1
        fi
    else
        echo "$package is already installed"
    fi
}

create_symlink() {
    local source=$1
    local target=$2
    
    if [ -L "$target" ]; then
        echo "Removing existing symlink at $target"
        rm "$target"
    elif [ -f "$target" ]; then
        echo "Backing up existing file $target to ${target}.backup"
        mv "$target" "${target}.backup"
    fi
    
    echo "Creating symlink from $source to $target"
    ln -s "$source" "$target"
}

# Base dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"

# Vim setup script
setup_vim() {
    check_and_install vim
    create_symlink "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
    # Create vim directories if they don't exist
    mkdir -p "$HOME/.vim/"{bundle,colors,autoload}
}

setup_vim
