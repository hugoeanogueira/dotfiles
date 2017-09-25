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

    ## make sure npm is at version 5 ##
    npm install -g npm@5;

    ## npm packages ##
    # npm install -g bower;
    npm install -g clean-css;
    npm install -g csslint;
    npm install -g gist;
    npm install -g gulp-cli;
    npm install -g grunt-cli;
    npm install -g htmlhint;
    npm install -g html-minifier;
    npm install -g http-server;
    npm install -g loadtest;
    npm install -g jsxhint;
    npm install -g jsonlint;
    npm install -g js-beautify;
    # npm install -g matches-selector;
    npm install -g minjson;
    npm install -g npm-check;
    npm install -g npm-check-updates;
    npm install -g node-sass;
    # npm install -g nodemon;
    # npm install -g karma;
    # npm install -g pm2;
    npm install -g randomperson;
    npm install -g serve;
    npm install -g svgo;
    npm install -g typescript;
    npm install -g uglify-js;
    npm install -g uglifycss;
    # npm install -g up;
    npm install -g webpack-dev-server;
    # npm install -g yo;

    # eslint & babel for sublime...
    npm install -g eslint;
    npm install -g eslint-config-airbnb;
    npm install -g eslint-config-angular;
    npm install -g eslint-plugin-angular;
    npm install -g eslint-plugin-import;
    npm install -g eslint-plugin-jsx-a11y;
    npm install -g eslint-plugin-react;
    npm install -g babel-eslint;
    npm install -g babel-plugin-dynamic-import-node;
    npm install -g babel-plugin-lodash;
    npm install -g babel-plugin-syntax-dynamic-import;
    npm install -g babel-plugin-transform-decorators-legacy;
    npm install -g babel-plugin-transform-react-jsx-source;
    npm install -g babel-preset-es2015;
    npm install -g babel-preset-react;
    npm install -g babel-preset-stage-2;
}

start;
