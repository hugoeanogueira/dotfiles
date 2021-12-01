#!/usr/bin/env bash

##
# 2.4) Default SSH keys
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

start () {
    echo "";
    info "--- 2.4) SSH ---";
    install;
    success "Done!";
}

has_ssh_key () {
    local default_key;
    default_key="$HOME/.ssh/id_rsa";

    if [[ -n "${default_key}" && -e "${default_key}" ]];
    then
        echo 1;
        return 1;
    fi;
}

install () {
    echo "Installing...";

    local email;

    if [[ $(has_ssh_key) != 1 ]];
    then
        info "Creating a new default key for SSH (id_rsa)";
        email="$(ask "Insert ssh key's comment message (e.g. user's email)")";

        ssh-keygen -t rsa -b 4096 -C "$email"
        eval "$(ssh-agent -s)"
        ssh-add "$HOME.ssh/id_rsa"

        success "A new default SSH key was created ($HOME.ssh/id_rsa)";
    else
        info "Default SSH key already exists.";
    fi;
}

start;
