#!/usr/bin/env bash

##
# 3) Brew formulas
# Update brew and install the formulas
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

start () {
    echo "";
    info "--- 3) Brew formulas ---";
    install;
    success "Done!";
}

install () {
    echo "Installing brew formulas...";

    ## brew formulas ##
    brew install autoconf;
    brew install ccat;
    brew install git-open;
    brew install htop-osx;
    brew install ktlint;
    brew install kubectl;
    brew install maven;
    brew install openssl;
    brew install shellcheck;
    brew install tree;
    brew install wget;
    brew install z;

    ## bash completion ##
    brew tap homebrew/completions;
    brew install bash-completion;

    # Dependencies to compile node-canvas during npm install
    # https://github.com/Automattic/node-canvas
    brew install pkg-config cairo pango libpng jpeg giflib librsvg
}

start;
