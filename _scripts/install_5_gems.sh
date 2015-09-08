#!/usr/bin/env bash

##
# 5) Ruby Gems
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

start () {
    echo "";
    info "--- 5) Ruby gems ---";
    install;
    success "Done!";
}

install () {
    echo "Installing ruby gems...";

    ## ruby gems ##
    gem install compass
    gem install scss_lint
    rbenv rehash
}

start;
