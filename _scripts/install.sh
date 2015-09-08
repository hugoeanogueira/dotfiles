#!/usr/bin/env bash

##
# Install a new Mac OS development environment (tested in Yosemite),
# including homebrew, git, dotfiles, etc.
#
# The default installation respect the dependencies between each script
# file (e.g. installing brew formulas need the brew and developer tools
# already installed in the system). Feel free to install each module
# separately, but as long as you respect the script dependencies.
#
# Default install order:
# 1) dotfiles
# 2) basics
# 3) brew_formulas
# 4) npm_packages
# 5) apps
# 6) sublime_plugins
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";


info "
+------------------------------------------------------------------+
| Installing:                                                      |
|                                                                  |
| 1) dotfiles                                                      |
| 2) basics                                                        |
|   2.1) cmd_line_tools                                            |
|   2.2) homebrew                                                  |
|   2.3) git                                                       |
|   2.4) ssh                                                       |
|   2.5) nvm_node                                                  |
|   2.6) pyenv                                                     |
|   2.7) rbenv                                                     |
|   2.8) jenv                                                      |
|   2.9) go                                                        |
| 3) brew_formulas                                                 |
| 4) npm_packages                                                  |
| 5) apps                                                          |
| 6) sublime_plugins                                               |
|                                                                  |
+------------------------------------------------------------------+
";

# install all scripts
# . "$DIR/install_1_dotfiles.sh";
# . "$DIR/install_2_basics.sh";
# . "$DIR/install_3_brew_formulas.sh";
# . "$DIR/install_4_npm_packages.sh";
# . "$DIR/install_5_gems.sh";
# . "$DIR/install_6_apps.sh";
# . "$DIR/install_7_sublime_packages.sh";

success "
+------------------------------------------------------------------+
| IT'S ALL DONE!                                                   |
|                                                                  |
| Don't forget to:                                                 |
| 1) Open Sublime Text 3 so it can install the missing packages;   |
| 2) Install JDK and add it to jenv;                               |
| 3) ... :p                                                        |
+------------------------------------------------------------------+
";
