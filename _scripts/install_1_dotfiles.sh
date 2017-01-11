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

install_vim () {

    if [[ ! -e "$HOME/.vim" ]];
    then
        ln -s "$PARENT_DIR/vim" "$HOME/.vim";
        vim +PluginInstall +qall
    else
        info "Vim configurations already present.";
    fi;
}

install () {
    echo "Installing dotfiles...";
    info "Symlinks will point from $HOME/ to $PARENT_DIR/.";

    # bash
    ln -s "$PARENT_DIR/bash/.bash_profile" "$HOME/.bash_profile";
    ln -s "$PARENT_DIR/bash/.bash_aliases" "$HOME/.bash_aliases";
    ln -s "$PARENT_DIR/bash/.bash_prompt" "$HOME/.bash_prompt";
    ln -s "$PARENT_DIR/bash/.bashrc" "$HOME/.bashrc";
    ln -s "$PARENT_DIR/bash/.exports" "$HOME/.exports";
    ln -s "$PARENT_DIR/bash/.functions" "$HOME/.functions";
    ln -s "$PARENT_DIR/bash/.inputrc" "$HOME/.inputrc";

    # bash completions
    ln -s "$PARENT_DIR/bash/completions/.git_completion.bash" "$HOME/.git_completion.bash";
    ln -s "$PARENT_DIR/bash/completions/.maven_completion.bash" "$HOME/.maven_completion.bash";

    # git
    ln -s "$PARENT_DIR/git/.gitconfig" "$HOME/.gitconfig";
    ln -s "$PARENT_DIR/git/.gitignore" "$HOME/.gitignore";

    # sublime
    ln -s "$PARENT_DIR/sublime/.editorconfig" "$HOME/.editorconfig";
    ln -s "$PARENT_DIR/sublime/.jscrc" "$HOME/.jscrc";
    ln -s "$PARENT_DIR/sublime/.jshintrc" "$HOME/.jshintrc";
    ln -s "$PARENT_DIR/sublime/.scss-lint.yml" "$HOME/.scss-lint.yml";

    # tmux
    ln -s "$PARENT_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf";

    # symlink .vimrc and install plugins
    install_vim;

    source "$HOME/.bash_profile";

    # manual...
    warn "Manually install the iterm theme!";
}

start;
