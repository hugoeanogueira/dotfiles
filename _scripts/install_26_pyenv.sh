#!/usr/bin/env bash

##
# 2.6) PyEnv
# https://github.com/yyuu/pyenv
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";
PYTHON_V2="2.7.10";
PYTHON_V3="3.4.3";

start () {
    echo "";
    info "--- 2.6) PyEnv ---";
    install;
    success "Done!";
}

has_pyenv () {
    local pyenv_binary;
    pyenv_binary=$(which pyenv);

    if [[ -n "${pyenv_binary}" && -e "${pyenv_binary}" ]];
    then
        echo 1;
        return 1;
    fi

    # method 2 (because sometimes, pyenv binary doesn't show up...)
    pyenv_binary="$HOME/.pyenv";
    if [[ -n "${pyenv_binary}" && -e "${pyenv_binary}" ]];
    then
        echo 1;
        return 1;
    fi;
}

update_bash () {
    local text;
    text="$(grep 'export PYENV_ROOT="$HOME/.pyenv"' $HOME/.bash_profile)";

    if [[ "${text}" == "" ]];
    then
        info 'Sourcing pyenv in .bash_profile';
        echo '
# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
[ -e "$PYENV_ROOT/bin" ] && eval "$(pyenv init -)"
' >> ~/.bash_profile;
        source "$HOME/.bash_profile";
    else
        info 'PyEnv already in .bash_profile';
    fi;
}

update_zshrc () {
    local text;
    text="$(grep 'export PYENV_ROOT="$HOME/.pyenv"' $HOME/.zshrc)";

    if [[ "${text}" == "" ]];
    then
        info 'Sourcing pyenv in .zshrc';
        echo '
# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
[ -e "$PYENV_ROOT/bin" ] && eval "$(pyenv init -)"
' >> ~/.zshrc;
    else
        info 'PyEnv already in .zshrc';
    fi;
}

has_python_v2 () {
    local text;
    text="$(pyenv versions | grep $PYTHON_V2)";

    if [[ "${text}" == "" ]];
    then
        echo 1;
        return 1;
    fi;
}

install_python_v2 () {

    if [[ $(has_python_v2) != 1 ]];
    then
        # CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install -v "$PYTHON_V2";
        info "Installing python v$PYTHON_V2";
        pyenv install -v "$PYTHON_V2";
    else
        info "Python v$PYTHON_V2 already installed.";
    fi;
}

has_python_v3 () {
    local text;
    text="$(pyenv versions | grep $PYTHON_V3)";

    if [[ "${text}" == "" ]];
    then
        echo 1;
        return 1;
    fi;
}

install_python_v3 () {

    if [[ $(has_python_v3) != 1 ]];
    then
        # CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install -v "$PYTHON_V3";
        info "Installing python v$PYTHON_V3";
        pyenv install -v "$PYTHON_V3";
    else
        info "Python v$PYTHON_V3 already installed.";
    fi;

    pyenv global $PYTHON_V3;
    pyenv shell $PYTHON_V3;
}

install () {
    echo "Installing...";

    if [[ $(has_pyenv) != 1 ]];
    then

        PYENV_ROOT="$HOME/.pyenv";
        PATH="$PYENV_ROOT/bin:$PATH";

        brew install pyenv
        eval "$(pyenv init -)";

        info "PyEnv installed!";
    else
        info "PyEnv already installed.";
    fi;

    update_bash;
    update_zshrc;

    install_python_v2;
    install_python_v3;

    pip install --upgrade pip
    pip install pylint;

    pyenv rehash;

    success "PyEnv and python ($PYTHON_V3 and $PYTHON_V2) installed!";
}

start;
