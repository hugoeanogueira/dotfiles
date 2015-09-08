#!/usr/bin/env bash

##
# 2) basics
#
# Install the basics development dependencies as:
# 1) Command Line Tools (for compiling stuff);
# 2) Homebrew
# 3) Git
# 4) SSH
# 5) NVM, node and npm
# 6) PyEnv
# 7) RbEnv
# 8) JEnv
# 9) Go
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

start () {
    echo "";
    info "--- 2) Basics ---";
    install;
}

install () {
    echo "Installing basics...";

    # install all scripts
    . "$DIR/install_21_cmd_line_tools.sh";
    . "$DIR/install_22_homebrew.sh";
    . "$DIR/install_23_git.sh";
    . "$DIR/install_24_ssh.sh";
    . "$DIR/install_25_nvm_node.sh";
    . "$DIR/install_26_pyenv.sh";
    . "$DIR/install_27_rbenv.sh";
    . "$DIR/install_28_jenv.sh";
    . "$DIR/install_29_go.sh";
}

start;
