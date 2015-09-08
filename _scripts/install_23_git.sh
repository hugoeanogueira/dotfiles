#!/usr/bin/env bash

##
# 2.3) Git
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

start () {
    echo "";
    info "--- 2.3) Git ---";
    install;
    success "Done!";
}

has_git () {
    local git_binary;
    git_binary=$(which git);

    if [[ -n "${git_binary}" && -e "${git_binary}" ]];
    then
        echo 1;
        return 1;
    fi;
}

install () {
    echo "Installing...";

    local name;
    local email;

    if [[ $(has_git) != 1 ]];
    then
        brew install git

        name="$(ask "Insert git user's name")";
        if [ -n name ]; then
            git config --global user.name "$name";
        fi;

        email="$(ask "Insert git user's email")";
        if [ -n email ]; then
            git config --global user.email "$email";
        fi;

        success "Git installed!";
    else
        info "Git already installed.";
    fi;
}

start;
