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

symlink_sublime () {

    local subl;
    local test_path;

    # 1) "/Applications/Sublime Text"
    test_path="/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl";
    if [[ -e "${test_path}" ]];
    then
        subl="$test_path";
    fi;

    # 2) "/Applications/Sublime Text"
    test_path="$HOME/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl";
    if [[ -e "${test_path}" ]];
    then
        subl="$test_path";
    fi;

    # make the symlink
    if [[ -n "${subl}" && -e "${subl}" ]];
    then
        ln -s "$subl" "/usr/local/bin/subl"
    fi;
}

update_path_mamp () {
    local text;
    text="$(grep 'export PATH=/Applications/MAMP/bin:$PATH;' $HOME/.bash_profile)";

    if [[ "${text}" == "" ]];
    then
        info 'Adding MAMP tp path in .bash_profile';
        echo '[ -e "/Applications/MAMP/bin" ] && export PATH=/Applications/MAMP/bin:$PATH;' >> "$HOME/.bash_profile";
    else
        info "MAMP already in PATH";
    fi;
}

install () {
    echo "Installing applications...";

    # install brew-cask and update formulas
    brew install caskroom/cask/brew-cask;
    brew tap caskroom/versions;
    brew update;

    brew cask install appcleaner;
    brew cask install caffeine;
    brew cask install cord;
    brew cask install diskmaker-x;
    brew cask install diskwave;
    brew cask install dropbox;
    brew cask install filezilla;
    brew cask install firefox;
    brew cask install firefox-nightly;
    brew cask install freac;
    brew cask install google-chrome;
    brew cask install google-chrome-canary;
    brew cask install google-drive;
    brew cask install handbrake;
    brew cask install handbrakecli;
    brew cask install ifunbox;
    brew cask install iterm2;
    brew cask install imageoptim;
    brew cask install licecap;
    brew cask install macpass;
    brew cask install mactracker;
    brew cask install magicprefs;
    brew cask install mplayer-osx-extended;
    brew cask install mysqlworkbench;
    brew cask install namechanger;
    brew cask install openemu;
    brew cask install opera;
    brew cask install psequel;
    brew cask install sdformatter;
    brew cask install sequel-pro;
    brew cask install skype;
    brew cask install slack;
    brew cask install spotify;
    brew cask install sourcetree;
    brew cask install sublime-text3;
    brew cask install teamviewer;
    brew cask install tunnelbear;
    brew cask install transmission;
    brew cask install trash-it;
    brew cask install tvrenamer;
    brew cask install valentina-studio;
    brew cask install virtualbox;
    brew cask install vagrant;
    brew cask install vlc;

    # requiring password
    brew cask install owncloud;
    brew cask install mamp;
    update_path_mamp;

    ## GPG
    ## https://gpgtoolsols.org/
    brew cask install gpgtools;
    npm install -g keybase-installer;

    symlink_sublime;
}


start;
