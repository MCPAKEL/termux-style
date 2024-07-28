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
