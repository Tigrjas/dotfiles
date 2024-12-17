#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Print with color
print_status() {
    echo -e "${2}$1${NC}"
}

# Check if nano is installed
if ! command -v nano &> /dev/null; then
    print_status "Nano is not installed. Please install it first." "$RED"
    exit 1
fi

# Backup existing configuration
if [ -f ~/.nanorc ]; then
    print_status "Backing up existing nano configuration..." "$YELLOW"
    mv ~/.nanorc ~/.nanorc.backup
    print_status "Existing configuration backed up to ~/.nanorc.backup" "$GREEN"
fi

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Create symbolic link
print_status "Creating symbolic link..." "$YELLOW"
ln -sf "$SCRIPT_DIR/nanorc" ~/.nanorc

# Verify the installation
if [ -L ~/.nanorc ] && [ -e ~/.nanorc ]; then
    print_status "Nano configuration installed successfully!" "$GREEN"
    print_status "Configuration file location: $(readlink -f ~/.nanorc)" "$GREEN"
else
    print_status "Installation failed!" "$RED"
    exit 1
fi

# Check for syntax highlighting files
if [ ! -d "/usr/share/nano" ] || [ -z "$(ls -A /usr/share/nano/*.nanorc 2>/dev/null)" ]; then
    print_status "Warning: Syntax highlighting files not found. You may need to install them." "$YELLOW"
    print_status "On Ubuntu/Debian: sudo apt-get install nano-syntax-highlighting" "$YELLOW"
    print_status "On macOS: brew install nano" "$YELLOW"
fi

# Test the configuration
if nano -V ~/.nanorc &> /dev/null; then
    print_status "Configuration syntax check passed." "$GREEN"
else
    print_status "Warning: Configuration syntax check failed." "$RED"
fi
