#!/usr/bin/env bash

##
# 2.7) RbEnv
# https://github.com/sstephenson/rbenv
#
#!/usr/bin/env bash

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

RUBY_V2="2.2.3";

start () {
    echo "";
    info "--- 2.7) RbEnv ---";
    install;
    success "Done!";
}

has_rbenv () {
    local rbenv_binary;
    rbenv_binary=$(which rbenv);

    if [[ -n "${rbenv_binary}" && -e "${rbenv_binary}" ]];
    then
        echo 1;
        return 1;
    fi

    # method 2 (because sometimes, rbenv binary doesn't show up...)
    rbenv_binary="$HOME/.rbenv";
    if [[ -n "${rbenv_binary}" && -e "${rbenv_binary}" ]];
    then
        echo 1;
        return 1;
    fi;
}

update_bash () {
    local text;
    text="$(grep 'export RBENV_ROOT="$HOME/.rbenv"' $HOME/.bash_profile)";

    if [[ "${text}" == "" ]];
    then
        info 'Sourcing rbenv in .bash_profile';
        echo '
# RbEnv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
[ -e "$RBENV_ROOT/bin" ] && eval "$(rbenv init -)"
' >> ~/.bash_profile;
        source "$HOME/.bash_profile";
    else
        info 'RbEnv already in .bash_profile';
    fi;
}

update_zshrc () {
    local text;
    text="$(grep 'export RBENV_ROOT="$HOME/.rbenv"' $HOME/.zshrc)";

    if [[ "${text}" == "" ]];
    then
        info 'Sourcing rbenv in .zshrc';
        echo '
# RbEnv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
[ -e "$RBENV_ROOT/bin" ] && eval "$(rbenv init -)"
' >> ~/.zshrc;
    else
        info 'RbEnv already in .zshrc';
    fi;
}

has_ruby_v2 () {
    local text;
    text="$(rbenv versions | grep $RUBY_V2)";

    if [[ "${text}" == "" ]];
    then
        echo 1;
        return 1;
    fi;
}

install_ruby_v2 () {

    if [[ $(has_ruby_v2) != 1 ]];
    then
        # CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" rbenv install -v "$RUBY_V2";
        info "Installing ruby v$RUBY_V2";
        rbenv install -v "$RUBY_V2";
    else
        info "Ruby v$RUBY_V2 already installed.";
    fi;

    rbenv global $RUBY_V2;
    # rbenv shell $RUBY_V2; # rbenv is buggy
}

install () {
    echo "Installing...";

    if [[ $(has_rbenv) != 1 ]];
    then

        RBENV_ROOT="$HOME/.rbenv";
        PATH="$RBENV_ROOT/bin:$PATH";

        brew install rbenv
        eval "$(rbenv init -)";
        brew install ruby-build

        info "RbEnv installed!";
    else
        info "RbEnv already installed.";
    fi;

    update_bash;
    update_zshrc;

    install_ruby_v2;
    rbenv rehash;

    success "RbEnv and ruby ($RUBY_V2) installed!";
}

start;
