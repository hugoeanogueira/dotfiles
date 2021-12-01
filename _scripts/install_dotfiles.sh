#!/usr/bin/env bash

##
# 1) Dotfiles
# Install the dotfiles by symlinking the files in this project to the
# user's home directory ($HOME)
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
PARENT_DIR=$(dirname "$DIR");

. "$DIR/utils.sh";

start () {
    echo "";
    info "--- 1) Dotfiles ---";
    install;
    success "Done!";
}

install () {
    echo "Installing dotfiles...";
    info "Symlinks will point from $HOME/ to $PARENT_DIR/.";

    # bash
    ln -s "$PARENT_DIR/bash/.bash_profile" "$HOME/.bash_profile";
    ln -s "$PARENT_DIR/bash/.bash_aliases" "$HOME/.bash_aliases";
    ln -s "$PARENT_DIR/bash/.bash_prompt" "$HOME/.bash_prompt";
    ln -s "$PARENT_DIR/bash/.exports" "$HOME/.exports";
    ln -s "$PARENT_DIR/bash/.functions" "$HOME/.functions";
    ln -s "$PARENT_DIR/bash/.inputrc" "$HOME/.inputrc";

    # bash completions
    ln -s "$PARENT_DIR/bash/completions/.git_completion.bash" "$HOME/.git_completion.bash";

    # git
    ln -s "$PARENT_DIR/git/.gitconfig" "$HOME/.gitconfig";
    ln -s "$PARENT_DIR/.gitignore" "$HOME/.gitignore";

    # editors
    ln -s "$PARENT_DIR/.editorconfig" "$HOME/.editorconfig";

    source "$HOME/.bash_profile";
}

start;
