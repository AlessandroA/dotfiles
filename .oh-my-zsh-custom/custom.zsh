################################################################################
# paths
# note: this section should go first
################################################################################

# system-wide virtual environments folder
export VIRTENVS_DIR="~/code/virtenvs"

################################################################################
# examples
################################################################################

# *.zsh files will be automatically loaded before plugins
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

################################################################################
# general purpose shortcuts
################################################################################

# exit (deactivate if in virtual environment)
e () {
    python -c 'import sys; print(sys.real_prefix)' 1>/dev/null 2>/dev/null \
        && IN_VENV=1 || IN_VENV=0
    if [ "$IN_VENV" = 1 ] ; then
        deactivate
    else
        exit
    fi
}

# clean vim temporary files
rmsw () {
    find . -name ".*.sw*" -delete
}

# clone an ARMmbed repository
armclone () {
    git clone --recursive git@github.com:ARMmbed/$@.git ~/code/ARMmbed/$@
}

# count files in folder
count () {
    ls -1 $@ | wc -l
}

# grep within source files
cgrep () {
    grep -R \
        --include="*.c" --include="*.h" --include="*.cpp" --include="*.hpp" \
        --include="*.py" \
        -E $1 .
}

# ARMmbed virtual environment
# the pydoc thingie fixes an error message on a non-existing alias
alias varm="pydoc () { } && source $VIRTENVS_DIR/ARMmbed/bin/activate"

# personal virtual environment
# the pydoc thingie fixes an error message on a non-existing alias
alias vper="pydoc () { } && source $VIRTENVS_DIR/personal/bin/activate"

# experimental virtual environment
# the pydoc thingie fixes an error message on a non-existing alias
alias vexp="pydoc () { } && source $VIRTENVS_DIR/experimental/bin/activate"

# activate whatever virtual environment, provided it is in the current folder
# the pydoc thingie fixes an error message on a non-existing alias
# Note: Unpredictable if there's more than one
alias vhere="pydoc () { } && source ./*/bin/activate"

# go to some frequent places
alias arm="cd ~/code/ARMmbed"
alias ale="cd ~/code/AlessandroA"
alias gis="cd ~/code/gists"
alias u="cd ~/code/AlessandroA/uvisor-lib/uvisor"
alias ulib="cd ~/code/AlessandroA/uvisor-lib"
alias uhw="cd ~/code/AlessandroA/uvisor-helloworld"
alias ult="cd ~/code/AlessandroA/uvisor-lib-tests"

################################################################################
# python and pip
################################################################################

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# fallback function to install global packages
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

################################################################################
# vim
################################################################################

# redefine vim so that when plugins are not available they are installed
vim() {
    # we trust there will always be a vim-* namespaced plugin
    if { ls $HOME/.vim/bundle/vim-* } > /dev/null 2>&1; then
        command vim "$@"
    else
        command vim -u $HOME/.vim/bundle.vim +BundleInstall +qall
        command vim "$@"
    fi
}
