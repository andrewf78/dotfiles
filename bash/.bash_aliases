# User specific aliases and functions
alias b="cd .."
alias bb="b;b"
alias bbb="bb;b"
alias bbbb="bbb;b"

alias ls="ls --color"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

alias vim='nvim'
alias vi='vim'
alias v='vi'

alias ppjson="python -m json.tool"

alias wk="cd $WKSPC"

function venv_activate() {
    if [ -d "$VENV_ROOT"/$1 ]; then
        source "$VENV_ROOT/$1/bin/activate"
        return 0
    else
        echo "No virtualenv named '$1' available"
    fi
    return 1
}

function venv_create() {
    if [ ! -d "$VENV_ROOT"/$1 ]; then
        virtualenv $VENV_ROOT/$1
        echo "Created new virtualenv '$1'"
        return 0
    fi;

    echo "Virtualenv '$1' already exists!"
    return 1
}

function venv_rm() {
    if [ -d "$VENV_ROOT"/$1 ]; then
        rm -r $VENV_ROOT/$1
        echo "Removed virtualenv '$1'"
        return 0
    fi;

    echo "Virtualenv '$1' does not exist!"
    return 1
}

function pygrep () {
    fgrep $1 -R . 2>&1 | grep -v Binary | grep -v json
}

export PETAL_CARD_REF='325000087042'
alias yapf_local_changes="git status | grep 'modified\|new file' | grep '.py$' | cut -d ':' -f '2' | xargs yapf --in-place --recursive --parallel"
# EOF
