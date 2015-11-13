#!/usr/bin/env bash

##
# 7) sublime_packages
# Install the Sublime Text 3 packages and add the "subl" symlink
#

# find folder
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
. "$DIR/utils.sh";
PACKAGES="$HOME/Library/Application Support/Sublime Text 3/Installed Packages";


start () {
    echo "";
    info "--- 7) Sublime Text 3 Packages ---";
    install;
    success "Done!";
}

create_plugins_folder () {
    if [[ ! -e "${PACKAGES}" ]];
    then
        mkdir -p "${PACKAGES}"
    else
        info "Plugins folder already present."
    fi;
}

install_package_control () {

    local package_control;
    package_control="$PACKAGES/Package Control.sublime-package";

    if [[ ! -e "${package_control}" ]];
    then
        echo "Installing 'Package Control'";
        curl 'https://sublime.wbond.net/Package%20Control.sublime-package' -o "$package_control"
        info "Package Control installed";
    else
        info "Package Control already installed."
    fi;
}

install_packages () {

    local config_dir;
    local config_file;

    config_dir="$HOME/Library/Application Support/Sublime Text 3/Packages/User";
    config_file="$config_dir/Package Control.sublime-settings";


    if [[ ! -e "$config_dir" ]];
    then
        mkdir -p "${config_dir}"
    fi;


    echo '
{
    "in_process_packages":
    [
    ],
    "installed_packages":
    [
        "AlignTab",
        "ApacheConf.tmLanguage",
        "Babel",
        "CSS3",
        "DocBlockr",
        "EditorConfig",
        "FuzzyFilePath",
        "Git Conflict Resolver",
        "Gitignore",
        "HTML Snippets",
        "HTML Underscore Syntax",
        "HTML-CSS-JS Prettify",
        "HTML5",
        "Handlebars",
        "Markdown Preview",
        "Minify",
        "nginx",
        "Objective-C Autocompletion",
        "Package Control",
        "Random Everything",
        "Razor",
        "SCSS",
        "Sass",
        "SideBarEnhancements",
        "SublimeLinter",
        "SublimeLinter-contrib-clang",
        "SublimeLinter-contrib-htmlhint",
        "SublimeLinter-contrib-java",
        "SublimeLinter-contrib-scss-lint",
        "SublimeLinter-csslint",
        "SublimeLinter-jshint",
        "SublimeLinter-json",
        "SublimeLinter-jsxhint",
        "SublimeLinter-php",
        "SublimeLinter-pylint",
        "SublimeLinter-ruby",
        "SublimeLinter-shellcheck",
        "Tag",
        "Vue Syntax Highlight"
    ]
}
' > "$config_file";

    warn "Sublime packages should be installed when opening Sublime Text 3 for the first."
    success "Done."
}

# @TODO this should go into an array...
install () {

    echo "Installing sublime packages...";
    echo "Plugins folder: $PACKAGES";

    create_plugins_folder;
    install_package_control;
    install_packages;
}

start;
