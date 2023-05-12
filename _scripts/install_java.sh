#!/usr/bin/env bash

##
# 2.8) JEnv
# https://github.com/gcuisinier/jenv
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";

echo "--- Java ---";

brew install --cask termurin19;

success "Done!";
