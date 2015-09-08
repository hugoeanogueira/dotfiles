#!/usr/bin/env bash

##
# 2.1) Command Line Tools
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

start () {
    echo "";
    info "--- 2.1) Command Line Tools ---";
    install;
    success "Done!";
}

has_command_line_tools () {
    local xcode_file;
    xcode_file=$(xcode-select -p 2>/dev/null);

    if [[ -n "${xcode_file}" && -e "${xcode_file}" ]]; then
        echo 1;
    fi
}

install () {
    echo "Installing...";

    if [[ $(has_command_line_tools) == 1 ]];
    then
        info "Command line tools already installed.";
        return 1;
    fi;

    info "Installing command line tools.
    A dialog to install command line tools will popup.
    Please follow the GUI instructions or
    press ctrl+C to cancel the script.";
    xcode-select --install &> /dev/null

    while [ ! $(has_command_line_tools) ];
    do
        printf '.';
        sleep 5;
    done

    success "Command line tools installed!";
}

start;
