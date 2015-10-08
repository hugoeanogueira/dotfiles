#!/usr/bin/env bash

##
# 4) NPM packages
# Install NPM global packages
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

start () {
    echo "";
    info "--- 5) NPM packages ---";
    install;
    success "Done!";
}

install () {
    echo "Installing npm packages...";

    ## npm packages ##
    npm install -g alloy
    npm install -g bower
    npm install -g csslint
    npm install -g gist
    npm install -g gittio
    npm install -g grunt-cli
    npm install -g htmlhint
    npm install -g http-server
    npm install -g jshint
    npm install -g jslint
    npm install -g jsxhint
    npm install -g jsonlint
    npm install -g matches-selector
    npm install -g npm-check
    npm install -g npm-check-updates
    npm install -g node-sass
    npm install -g nodemon
    npm install -g npm
    npm install -g pm2
    npm install -g randomperson
    npm install -g serve
    npm install -g titanium
    npm install -g yo
}

start;
