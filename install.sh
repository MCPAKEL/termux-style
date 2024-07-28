#!/bin/bash

# Update and upgrade packages
pkg update -y && pkg upgrade -y

# Install useful packages
pkg install -y python figlet toilet ncurses-utils

# Install additional fonts for better appearance
pkg install -y fontconfig
mkdir -p ~/.termux
echo "font: x11-misc/fixed" > ~/.termux/font.ttf

# Create style.py script
cat << 'EOF' > style.py
import os

def create_termux_style():
    bashrc_path = os.path.expanduser("~/.bashrc")
    
    # Menambahkan styling ke .bashrc
    style = '''
# Termux style customization
PS1='\[\e[32m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\]:\[\e[34m\]\w\[\e[m\]\\$ '
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
    '''
    
    with open(bashrc_path, 'a') as bashrc:
        bashrc.write(style)
    
    print("Termux style updated. Please restart Termux or run 'source ~/.bashrc' to see the changes.")

if __name__ == "__main__":
    create_termux_style()
EOF

# Run the style.py script
python style.py

# Print message
echo "Termux customization completed! Restart Termux or run 'source ~/.bashrc' to apply the changes."
