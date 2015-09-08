#!/usr/bin/env bash

##
# 2.5) NVM, node and npm
# https://github.com/creationix/nvm
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

start () {
    echo "";
    info "--- 2.5) NVM, node and npm ---";
    install;
    success "Done!";
}

has_nvm () {
    local nvm_binary;
    nvm_binary=$(which nvm);

    if [[ -n "${nvm_binary}" && -e "${nvm_binary}" ]];
    then
        echo 1;
        return 1;
    fi

    # method 2 (because sometimes, nvm binary doesn't show up...)
    nvm_binary="$HOME/.nvm";
    if [[ -n "${nvm_binary}" && -e "${nvm_binary}" ]];
    then
        echo 1;
        return 1;
    fi;
}

has_node () {
    local node_binary;
    node_binary=$(which node);

    if [[ -n "${node_binary}" && -e "${node_binary}" ]];
    then
        echo 1;
        return 1;
    fi;
}

has_nvm_bash () {
    local text;
    text="$(grep 'export NVM_DIR=$HOME/.nvm' $HOME/.bash_profile)";

    if [[ -n "${text}" ]];
    then
        echo 1;
        return 1;
    fi;
}

update_bash () {

    if [[ $(has_nvm_bash) != 1 ]];
    then
        echo '
# Start NVM, NPM and NodeJS
export NVM_DIR=$HOME/.nvm
source $NVM_DIR/nvm.sh' >> ~/.bash_profile

    source "$HOME/.bash_profile"
    fi;
}

has_nvm_zshrc () {
    local text;
    text="$(grep 'export NVM_DIR="$HOME/.nvm"' $HOME/.zshrc)";

    if [[ -n "${text}" ]];
    then
        echo 1;
        return 1;
    fi;
}

update_zshrc () {

    if [[ $(has_nvm_bash) != 1 ]];
    then
        echo '
# Start NVM, NPM and NodeJS
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"' >> ~/.zshrc

    source "$HOME/.zshrc"
    fi;
}


install () {
    echo "Installing...";


    if [[ $(has_nvm) != 1 ]];
    then
        # install nvm
        info "Installing nvm.";
        export NVM_DIR=$HOME/.nvm
        brew install nvm;
        source $NVM_DIR/nvm.sh;
    else
        info "NVM already installed.";
    fi;


    if [[ $(has_node) != 1 ]];
    then
        # install node and npm
        info "Installing node and npm.";
        nvm install 0.12;       # install 0.10.38 if you have problems with 0.12.x
        nvm use 0.12;
        nvm alias default 0.12; # install 0.10.38 if you have problems with 0.12.x

        # update bash_profile
        touch ~/.bash_profile ~/.zshrc;
    else
        info "Node already installed.";
    fi;

    update_bash;
    update_zshrc;

    # update npm to version 2.x and set log level to info
    info "Updating npm to latest version";
    npm install -g npm@next
    npm config set loglevel info

    success "NVM installed!";
}

start;
