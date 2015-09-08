#!/usr/bin/env bash

##
# 2.9) Go (golang)
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

start () {
    echo "";
    info "--- 2.9) Go (golang) ---";
    install;
    success "Done!";
}

has_go () {
    local go_binary;
    go_binary=$(which go);

    if [[ -n "${go_binary}" && -e "${go_binary}" ]];
    then
        echo 1;
        return 1;
    fi

    # method 2 (because sometimes, go binary doesn't show up...)
    go_binary="$HOME/Go";
    if [[ -n "${go_binary}" && -e "${go_binary}" ]];
    then
        echo 1;
        return 1;
    fi;
}

has_go_bash () {
    local text;
    text="$(grep 'export GOPATH="$HOME/Go"' $HOME/.bash_profile)";

    if [[ -n "${text}" ]];
    then
        echo 1;
        return 1;
    fi;
}

update_bash () {

    if [[ $(has_go_bash) != 1 ]];
    then
        echo '
# Start Go
export GOPATH="$HOME/Go"
export GOROOT="/usr/local/opt/go/libexec"
PATH="$PATH:$GOPATH/bin"
PATH="$PATH:$GOROOT/bin"
source "$GOPATH/go.sh"' >> ~/.bash_profile

    source "$HOME/.bash_profile"
    fi;
}

has_go_zshrc () {
    local text;
    text="$(grep 'export GOPATH="$HOME/Go"' $HOME/.zshrc)";

    if [[ -n "${text}" ]];
    then
        echo 1;
        return 1;
    fi;
}

update_zshrc () {

    if [[ $(has_go_bash) != 1 ]];
    then
        echo '
# Start Go
export GOPATH="$HOME/Go"
export GOROOT="/usr/local/opt/go/libexec"
PATH="$PATH:$GOPATH/bin"
PATH="$PATH:$GOROOT/bin"
source "$GOPATH/go.sh"' >> ~/.zshrc

    source "$HOME/.zshrc"
    fi;
}


install () {
    echo "Installing...";


    if [[ $(has_go) != 1 ]];
    then
        # install go
        info "Installing go.";
        export GOPATH="$HOME/Go"
        export GOROOT="/usr/local/opt/go/libexec"
        PATH="$PATH:$GOPATH/bin"
        PATH="$PATH:$GOROOT/bin"
        mkdir "$GOPATH";
        brew install go
        go get golang.org/x/tools/cmd/godoc
        go get golang.org/x/tools/cmd/vet
    else
        info "Go already installed.";
    fi;

    update_bash;
    update_zshrc;

    success "Go installed!";
}

start;
