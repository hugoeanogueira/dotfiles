#!/usr/bin/env bash

##
# 6) Applications
# Install development applications using brew-cask
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

start () {
    echo "";
    info "--- 6) Applications (using brew cask) ---";
    install;
    success "Done!";
}

install () {
    echo "Installing applications...";

    brew install --cask appcleaner;
    brew install --cask caffeine;
    brew install --cask docker;
    brew install --cask firefox;
    brew install --cask google-chrome;
    brew install --cask google-cloud-sdk;
    brew install --cask handbrake;
    brew install --cask imageoptim;
    brew install --cask insomnia;
    brew install --cask intellij-idea;
    brew install --cask iterm2;
    brew install --cask licecap;
    brew install --cask macpass;
    brew install --cask mactracker;
    brew install --cask namechanger;
    brew install --cask openemu;
    brew install --cask slack;
    brew install --cask spotify;
    brew install --cask sublime-text;
    brew install --cask transmission;
    brew install --cask virtualbox;
    brew install --cask visual-studio-code;
    brew install --cask vlc;
    brew install --cask zoomus;

    ## unused apps
    # brew install --cask 4k-video-downloader
    # brew install --cask atom;
    # brew install --cask charles;
    # brew install --cask chef/chefchefdk
    # brew install --cask cloudup;
    # brew install --cask cord;
    # brew install --cask dbeaver-community;
    # brew install --cask diskmaker-x;
    # brew install --cask diskwave;
    # brew install --cask dropbox;
    # brew install --cask filezilla;
    # brew install --cask gpgtools;
    # brew install --cask ifunbox;
    # brew install --cask minikube;
    # brew install --cask mysqlworkbench;
    # brew install --cask opera;
    # brew install --cask oversight;
    # brew install --cask postman;
    # brew install --cask psequel;
    # brew install --cask sdformatter;
    # brew install --cask sequel-pro;
    # brew install --cask teamviewer;
    # brew install --cask trash-it;
    # brew install --cask tunnelbear;
    # brew install --cask tvrenamer;
    # brew install --cask vagrant;
    # brew install --cask zeplin;
    # vagrant plugin install vagrant-berkshelf;
    # vagrant plugin install vagrant-cachier;
    # vagrant plugin install vagrant-omnibus;
}


start;
