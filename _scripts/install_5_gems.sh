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

    # IN EL CAPITAN USE:
    # gem install -n /usr/local/bin scss_lint

    ## ruby gems ##
    gem install compass;
    gem install jekyll;
    gem install scss_lint;
    rbenv rehash;
}

start;
