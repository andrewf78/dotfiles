#OSX terminal specific setup file.

# PS1 Setup: <user>@<host>:<cwd>
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# Setup terminal colors.
export CLICOLOR=1
export LSCOLORS=BxFxBxDxCxegedabagacad

# Apply aliases in .bash_aliases.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# PATH manipulations.
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
