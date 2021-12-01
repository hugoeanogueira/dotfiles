#!/usr/bin/env bash

##
# 2.2) Homebrew
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

start () {
    echo "";
    info "--- 2.2) Homebrew ---";
    install;
    success "Done!";
}

has_brew () {
    local brew_binary;
    brew_binary=$(which brew);

    if [[ -n "${brew_binary}" && -e "${brew_binary}" ]];
    then
        echo 1;
        return 1;
    fi
}

install () {
    echo "Installing...";

    if [[ $(has_brew) == 1 ]];
    then
        info "Updating homebrew repositories and packages"
        brew update;
        brew upgrade;
        brew cleanup;
        success "Homebrew and packages updated!";
    else
        info "Installing homebrew";

        # @TODO fix this because it needs sudo
        printf '\n' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
        # └─ simulate ENTER keypress

        success "Installed homebrew";
    fi
}

start;
