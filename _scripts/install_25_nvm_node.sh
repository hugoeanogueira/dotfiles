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

update_bash () {
    local text;
    text="$(grep '/nvm.sh' $HOME/.bash_profile)";

    if [[ "${text}" == "" ]];
    then
        info 'Sourcing nvm in .bash_profile';
        echo '
# Start NVM, NPM and NodeJS
export NVM_DIR="$HOME/.nvm"
[ -e "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
' >> ~/.bash_profile;
        source "$HOME/.bash_profile";
    else
        info 'Nvm already in .bash_profile';
    fi;
}

update_zshrc () {
    local text;
    text="$(grep '/nvm.sh' $HOME/.zshrc)";

    if [[ "${text}" == "" ]];
    then
        info 'Sourcing nvm in .zshrc';
        echo '
# Start NVM, NPM and NodeJS
export NVM_DIR="$HOME/.nvm"
[ -e "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
' >> ~/.zshrc;
        source "$HOME/.zshrc";
    else
        info 'Nvm already in .zshrc';
    fi;
}


install () {
    echo "Installing...";


    if [[ $(has_nvm) != 1 ]];
    then
        # install nvm
        info "Installing nvm.";

        brew install nvm;
        mkdir "$HOME/.nvm";
        cp "$(brew --prefix nvm)/nvm-exec" "$HOME/.nvm";
        [ -e "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh";
    else
        info "NVM already installed.";
    fi;

    update_bash;
    update_zshrc;

    if [[ $(has_node) != 1 ]];
    then
        # install node and npm
        info "Installing node and npm.";
        nvm install 8;
        nvm alias default 8;
        nvm use default;

        # update bash_profile
        touch ~/.bash_profile ~/.zshrc;
    else
        info "Node already installed.";
    fi;

    # update npm to version 2.x and set log level to info
    info "Updating npm to latest version";
    npm install -g npm@next
    npm config set loglevel info

    success "NVM installed!";
}

start;
