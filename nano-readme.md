# Nano Configuration

This repository contains my personal nano text editor configuration, making it easy to maintain a consistent editing experience across different machines.

## What's Included

- `.nanorc` configuration file with custom settings
- Syntax highlighting configurations
- Custom key bindings
- Auto-indent settings
- Line numbering

## Installation
1. Clone this repository into the home directory:
```bash
git clone git@github.com:Tigrjas/dotfiles.git
```
2. Change into the /dotfile directory

3. Run the bash script to install nano and the included nano customizations
```bash
bash nano-install.sh
```

## Key Features
- Line numbers enabled
- Syntax highlighting for common file types
- Mouse support
- 4-space indentation
- Tabs converted to spaces

## Customization
To modify the configuration:

1. Edit the `nanorc` file in this repository
2. Commit and push your changes
3. On other machines, pull the latest changes

## Troubleshooting

### Common Issues

1. **Syntax highlighting not working**
   - Ensure nano is up to date
   - Verify syntax files are installed: `ls /usr/share/nano/`

2. **Configuration not loading**
   - Check if the symbolic link is correct: `ls -la ~/.nanorc`
   - Verify file permissions: `ls -l ~/.nano-config/nanorc`
