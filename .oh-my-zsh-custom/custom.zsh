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

# ARMmbed virtual environment
# the pydoc thingie fixes an error message on a non-existing alias
alias varm="pydoc () { } && source $VIRTENVS_DIR/ARMmbed/bin/activate"

# personal virtual environment
# the pydoc thingie fixes an error message on a non-existing alias
alias vpers="pydoc () { } && source $VIRTENVS_DIR/personal/bin/activate"

# go to some frequent places
alias arm="cd ~/code/ARMmbed"
alias ale="cd ~/code/AlessandroA"
alias u="cd ~/code/uvisor"
alias ulib="cd ~/code/uvisor-lib"
alias uhw="cd ~/code/uvisor-helloworld"

################################################################################
# python and pip
################################################################################

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# fallback function to install global packages
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}