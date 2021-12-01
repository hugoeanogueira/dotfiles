#!/usr/bin/env bash

##
# Install a new Mac OS development environment (tested in Yosemite),
# including homebrew, git, dotfiles, etc.
#
# The default installation respects the dependencies between each script
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
| - dotfiles                                                       |
| - basics                                                         |
|   - cmd_line_tools                                               |
|   - homebrew                                                     |
|   - git                                                          |
|   - ssh                                                          |
|   - nvm_node                                                     |
| - brew_formulas                                                  |
| - apps                                                           |
| - sublime text packages                                          |
|                                                                  |
+------------------------------------------------------------------+
";

# install all scripts
. "$DIR/install_dotfiles.sh";
. "$DIR/install_cmd_line_tools.sh";
. "$DIR/install_homebrew.sh";
. "$DIR/install_java.sh";
. "$DIR/install_git.sh";
. "$DIR/install_ssh.sh";
. "$DIR/install_nvm_node.sh";
. "$DIR/install_brew_formulas.sh";
. "$DIR/install_apps.sh";
. "$DIR/install_sublime_packages.sh";

warn "Manually run the 'install_osx_configs.sh' script to customize your Mac OS!";

success "
+------------------------------------------------------------------+
| IT'S ALL DONE!                                                   |
|                                                                  |
| Don't forget to:                                                 |
| 1) Open Sublime Text 3 to install the missing packages;          |
| 2) Configure iTerm theme;                                        |
| 3) Configure Intellij and VS Code;                               |
+------------------------------------------------------------------+
";
