#!/usr/bin/env bash

##
# 2.8) JEnv
# https://github.com/gcuisinier/jenv
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";
JAVA_VERSION="2.2.3";

start () {
    echo "--- 2.7) JEnv ---";
    install;
    success "Done!";
}

has_jenv () {
    local jenv_binary;
    jenv_binary=$(which jenv);

    if [[ -n "${jenv_binary}" && -e "${jenv_binary}" ]];
    then
        echo 1;
        return 1;
    fi

    # method 2 (because sometimes, jenv binary doesn't show up...)
    jenv_binary="$HOME/.jenv";
    if [[ -n "${jenv_binary}" && -e "${jenv_binary}" ]];
    then
        echo 1;
        return 1;
    fi;
}

has_jenv_bash () {
    local text;
    text="$(grep 'export JENV_ROOT="$HOME/.jenv"' $HOME/.bash_profile)";

    if [[ -n "${text}" ]];
    then
        echo 1;
        return 1;
    fi;
}

update_bash () {

    if [[ $(has_jenv_bash) != 1 ]];
    then
        echo '
# JEnv
export JENV_ROOT="$HOME/.jenv"
export PATH="$JENV_ROOT/bin:$PATH"
eval "$(jenv init -)"' >> ~/.bash_profile;

    source "$HOME/.bash_profile";
    fi;
}

has_jenv_zshrc () {
    local text;
    text="$(grep 'export JENV_ROOT="$HOME/.jenv"' $HOME/.zshrc)";

    if [[ -n "${text}" ]];
    then
        echo 1;
        return 1;
    fi;
}

update_zshrc () {

    if [[ $(has_jenv_bash) != 1 ]];
    then
        echo '
# JEnv
export JENV_ROOT="$HOME/.jenv"
export PATH="$JENV_ROOT/bin:$PATH"
eval "$(jenv init -)"' >> ~/.zshrc;
    fi;
}

has_java_jdk () {
    local text;
    text="$(java -version | grep 'java version')";

    if [[ -n "${text}" ]];
    then
        echo 1;
        return 1;
    fi;
}

install_java_jdk () {

    warn "
+------------------------------------------------------------------+
| Install JVM machines (JDK) manually and add them in jenv using:  |
| java -v   # (and manual install the machine)                     |
| jenv add /path/to/java/home                                      |
+------------------------------------------------------------------+
";

    # if [[ $(has_java_jdk) != 1 ]];
    # then
    #     # CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" jenv install -v "$JAVA_VERSION";
    #     info "Installing java v$JAVA_VERSION";
    #     jenv install -v "$JAVA_VERSION";
    # else
    #     info "Java v$JAVA_VERSION already installed.";
    # fi;

    # jenv global $JAVA_VERSION;
    # # jenv shell $JAVA_VERSION; # jenv is buggy
}

install () {
    echo "Installing...";

    if [[ $(has_jenv) != 1 ]];
    then

        JENV_ROOT="$HOME/.jenv";
        PATH="$JENV_ROOT/bin:$PATH";

        brew install jenv
        eval "$(jenv init -)";

        info "JEnv installed!";
    else
        info "JEnv already installed.";
    fi;

    update_bash;
    update_zshrc;

    install_java_jdk;

    success "JEnv and JDK ($JAVA_VERSION) installed!";
}

start;
