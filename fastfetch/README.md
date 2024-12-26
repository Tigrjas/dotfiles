# Complete Guide to Installing and Configuring Fastfetch on Linux

Fastfetch is a fast and highly customizable system information tool for Linux. This guide will walk you through different installation methods and basic configuration.

## Prerequisites

Before installing Fastfetch, ensure you have the following:
- Administrative (sudo) privileges
- Terminal access
- Internet connection
- (Optional) Nerd Fonts installed for enhanced visual display

## Installation Methods

### Method 1: APT Package Manager (Simple Method)
If your distribution supports it, this is the easiest method:

1. **Update package list:**
   ```bash
   sudo apt update
   ```

2. **Install Fastfetch:**
   ```bash
   sudo apt install fastfetch
   ```

Note: This method may install an older version depending on your distribution's package repository.

### Method 2: Manual Installation (Latest Version)

1. **Install required dependencies:**
   ```bash
   sudo apt update
   sudo apt install curl wget jq
   ```

2. **Set up environment variables:**
   ```bash
   # Get latest version
   NEO_VERSION=$(curl -s https://api.github.com/repos/fastfetch-cli/fastfetch/releases/latest | jq -r '.name')
   
   # Set architecture (choose one):
   CPU_ARCH=amd64        # For x64 systems
   # OR
   CPU_ARCH=aarch64      # For ARM systems (e.g., Raspberry Pi)
   ```

3. **Download the latest version:**
   ```bash
   wget https://github.com/fastfetch-cli/fastfetch/releases/download/$NEO_VERSION/fastfetch-linux-$CPU_ARCH.deb -O fastfetch.deb
   ```

4. **Install the package:**
   ```bash
   sudo apt install ./fastfetch.deb
   ```

