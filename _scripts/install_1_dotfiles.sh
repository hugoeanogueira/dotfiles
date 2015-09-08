#!/usr/bin/env bash

##
# 1) Dotfiles
# Install the dotfiles by symlinking the files in this project to the
# user's home directory ($HOME)
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

start () {
    echo "";
    info "--- 1) Dotfiles ---";
    install;
    success "Done!";
}

install () {
    echo "Installing dotfiles...";
}

start;
