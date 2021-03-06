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

update_path_autoenv () {
    local text;
    text="$(grep 'autoenv/activate.sh' $HOME/.bash_profile)";

    if [[ "${text}" == "" ]];
    then
        info 'Sourcing autoenv in .bash_profile';
        echo '
# autoenv
[ -e "/usr/local/opt/autoenv/activate.sh" ] && source "/usr/local/opt/autoenv/activate.sh";
' >> "$HOME/.bash_profile";
    else
        info "Autoenv already in PATH";
    fi;
}

update_path_bash_completion () {
    local text;
    text="$(grep 'etc/bash_completion' $HOME/.bash_profile)";

    if [[ "${text}" == "" ]];
    then
        info 'Sourcing autoenv in .bash_profile';
        echo '
# bash auto completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi' >> "$HOME/.bash_profile";
    else
        info "Bash completion already in PATH";
    fi;
}

update_path_z () {
    local text;
    text="$(grep 'profile.d/z.sh' $HOME/.bash_profile)";

    if [[ "${text}" == "" ]];
    then
        info 'Sourcing rupa/z in .bash_profile';
        echo '
# rupa/z
if command -v brew >/dev/null 2>&1; then
    [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi
' >> "$HOME/.bash_profile";
    else
        info "Rupa/z already in PATH";
    fi;
}

install () {
    echo "Installing brew formulas...";

    # add repositories
    brew tap homebrew/fuse;
    brew update;

    ## brew formulas ##
    brew install ack;
    brew install apg;
    brew install autoconf;
    brew install ccat;
    brew install gist;
    brew install git-crypt;
    brew install git-flow-avh;
    brew install git-open;
    brew install htop-osx;
    brew install httpie;
    brew install imgcat;
    brew install jmeter;
    brew install kubectl;
    brew install m-cli;
    brew install mas;
    brew install maven;
    brew install md5sha1sum;
    brew install nmap;
    brew install openssl;
    brew install ossp-uuid;
    brew install phantomjs;
    brew install shellcheck;
    brew install sshfs;
    brew install tldr;
    brew install tmux;
    brew install to;
    brew install tree;
    brew install wget;
    
    # brew install ansible;
    # brew install postgresql;
    # brew install scala --with-docs;
    # brew install speedtest_cli;
    # brew install unrar;
    # brew install wifi-password;
    
    ## ansible roles ##
    # ansible-galaxy install ANXS.build-essential --force;
    # ansible-galaxy install ANXS.nodejs --force;
    # ansible-galaxy install ANXS.postgresql --force;

    ## autoenv ##
    # brew install autoenv;
    # update_path_autoenv;

    ## bash completion ##
    brew tap homebrew/completions;
    brew install bash-completion;
    update_path_bash_completion;

    ## z ##
    brew install z;
    update_path_z;
}

start;
