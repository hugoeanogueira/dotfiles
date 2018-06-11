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
    info "--- 6) Applications (using brew-cask) ---";
    install;
    success "Done!";
}

install () {
    echo "Installing applications...";

    # install brew-cask and update formulas
    # brew install caskroom/cask/brew-cask; # deprecated (now bundled with brew)
    brew tap caskroom/cask;
    brew tap caskroom/versions;
    brew update;

    brew cask install 4k-video-downloader
    brew cask install appcleaner;
    brew cask install caffeine;
    brew cask install charles;
    brew cask install cloudup;
    brew cask install diskmaker-x;
    brew cask install docker;
    brew cask install dropbox;
    brew cask install firefox;
    brew cask install freac;
    brew cask install google-chrome;
    brew cask install google-chrome-canary;
    brew cask install google-cloud-sdk;
    brew cask install google-drive;
    brew cask install handbrake;
    brew cask install ifunbox;
    brew cask install intellij-idea-ce;
    brew cask install iterm2;
    brew cask install imageoptim;
    brew cask install licecap;
    brew cask install macpass;
    brew cask install mactracker;
    brew cask install minikube;
    brew cask install namechanger;
    brew cask install openemu;
    brew cask install sdformatter;
    brew cask install slack;
    brew cask install spotify;
    brew cask install sublime-text;
    brew cask install teamviewer;
    brew cask install transmission;
    brew cask install trash-it;
    brew cask install tvrenamer;
    brew cask install virtualbox;
    brew cask install vlc;
    brew cask install zeplin;
    brew cask install zoomus;

    ## unused apps
    # brew cask install atom;
    # brew cask install chefdk
    # brew cask install cord;
    # brew cask install dbeaver-community;
    # brew cask install diskwave;
    # brew cask install filezilla;
    # brew cask install firefoxnightly;
    # brew cask install mysqlworkbench;
    # brew cask install opera;
    # brew cask install oversight;
    # brew cask install psequel;
    # brew cask install sequel-pro;
    # brew cask install skype;
    # brew cask install tunnelbear;
    # brew cask install vagrant;
    # brew cask install valentina-studio;
   
    echo "PLEASE INSTALL OVERSIGHT MANUALLY!";
    echo "run 'brew cask install oversight'";

    # vagrant plugin install vagrant-berkshelf;
    # vagrant plugin install vagrant-cachier;
    # vagrant plugin install vagrant-omnibus;

    ## GPG
    ## https://gpgtoolsols.org/
    brew cask install gpgtools;
    npm install -g keybase-installer;
}


start;
