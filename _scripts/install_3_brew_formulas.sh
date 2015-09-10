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
    text="$(grep 'source "/usr/local/opt/autoenv/activate.sh";' $HOME/.bash_profile)";

    if [[ -n "${text}" ]];
    then
        echo 'source "/usr/local/opt/autoenv/activate.sh";' >> "$HOME/.bash_profile";
    else
        info "Autoenv already in PATH";
    fi;
}

install () {
    echo "Installing brew formulas...";

    # add repositories
    brew tap homebrew/fuse;
    brew tap theory/sqitch;
    brew update;

    ## brew formulas ##
    brew install ack;
    brew install ansible;
    brew install apg;
    brew install autoconf;
    brew install gist;
    brew install git-crypt;
    brew install git-flow;
    brew install git-open;
    brew install htop-osx;
    brew install md5sha1sum;
    brew install nmap;
    brew install openssl;
    brew install ossp-uuid;
    brew install phantomjs;
    brew install postgresql;
    brew install shellcheck;
    brew install speedtest_cli;
    brew install sshfs;
    brew install tmux;
    brew install to;
    brew install tree;
    brew install unrar;
    brew install sqitch;
    brew install wifi-password;
    brew install wget;
    brew install z;

    ## ansible roles ##
    ansible-galaxy install ANXS.build-essential --force;
    ansible-galaxy install ANXS.nodejs --force;
    ansible-galaxy install ANXS.postgresql --force;

    ## autoenv ##
    brew install autoenv;
    update_path_autoenv;
}

start;
