#!/usr/bin/env bash

##
# Install scripts shared utils
#

# Colors
# nc     = '\033[0m';
# gray   = '\033[0;30m';
# red    = '\033[0;31m';
# green  = '\033[0;32m';
# yellow = '\033[0;33m';
# cyan   = '\033[0;36m';

# Status indicators
msg () {
    echo "$@";
}

warn () {
    printf "\033[0;33m %s \033[0m \n" "$@";
}

info () {
    printf "\033[0;36m %s \033[0m \n" "$@";
}

success () {
    printf "\033[0;32m %s \033[0m \n" "$@";
}

error () {
    printf "\033[0;31m %s \033[0m \n" "$@"; >&2;
    exit 1;
}


prompt () {
    echo "$@";
    select yn in "Yes" "No"; do
        case ${yn} in
            Yes ) return 0; exit;;
            No ) return 1; exit;;
        esac
    done
}

ask () {
    local answer;
    read  -p "${@}: " answer;
    echo "${answer}";
}

ask_default () {

    local question;
    local default_value;
    local answer;

    question="$1";
    default_value="$2";
    answer=$(ask "$question [$2]");

    if [ -z "${answer}" ]; then
        echo "${default_value}";
    else
        echo "${answer}";
    fi
}
