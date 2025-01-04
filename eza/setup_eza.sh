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

check_and_install eza