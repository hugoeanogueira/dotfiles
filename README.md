# dotfiles

## Installation ##
You may either run the `_/scripts/install.sh` to install all dotfiles and
remaining software in a new developing machine, or cherry-pick what to install
from the scripts directory and each configuration folder.

To install all in a new machine (without git):
```
curl '' -o '' && tar -xzf '' && . '_scripts/install.sh';
```

To install only the dotfiles (without git)
```
curl '' -o '' && tar -xzf '' && . '_scripts/install_1_dotfiles.sh';
```

## What's inside ##
```
├── 1) dofiles (and stuff)
│   ├── bash
│   │   ├── .bash_aliases
│   │   ├── .bash_profile
│   │   ├── .bash_prompt
│   │   ├── .bashrc
│   │   ├── .exports
│   │   ├── .functions
│   │   └── .inputrc
│   ├── git
│   │   ├── .gitconfig
│   │   └── .gitignore
│   ├── iterm
│   │   └── spacedust_custom.itermcolors
│   ├── osx
│   │   └── .osx
│   ├── sublime
│   │   ├── .editorconfig
│   │   ├── .jscsrc
│   │   ├── .jshintrc
│   │   └── .scss-lint.yml
│   ├── tmux
│   │   └── .tmux.conf
│   └── vim
│       ├── .vimrc
│       ├── backups
│       ├── plugins
│       ├── snippets
│       ├── swaps
│       └── undos
|
├── 2) basics
│   ├── 1 Command Line Tools
│   ├── 2 Homebrew
│   ├── 3 Git
│   ├── 4 SSH
│   ├── 5 NVM, node and npm
│   ├── 6 PyEnv
│   ├── 7 RbEnv
│   ├── 8 JEnv
│   └── 9 Go
|
├── 3) brew formulas
│   ├── ack
│   ├── ansible
│   ├── apg
│   ├── autoenv
│   ├── autoconf
│   ├── gist
│   ├── git-crypt
│   ├── git-flow
│   ├── git-open
│   ├── htop-osx
│   ├── md5sha1sum
│   ├── nmap
│   ├── openssl
│   ├── ossp-uuid
│   ├── phantomjs
│   ├── postgresql
│   ├── shellcheck
│   ├── speedtest_cli
│   ├── sshfs
│   ├── tmux
│   ├── tree
│   ├── unrar
│   ├── sqitch
│   ├── wifi-password
│   ├── wget
│   └── z
|
├── 4) npm global packages
│   ├── alloy
│   ├── bower
│   ├── csslint
│   ├── gist
│   ├── grunt-cli
│   ├── htmlhint
│   ├── http-server
│   ├── jshint
│   ├── jslint
│   ├── jsxhint
│   ├── jsonlint
│   ├── matches-selector
│   ├── node-sass
│   ├── nodemon
│   ├── npm
│   ├── pm2
│   ├── randomperson
│   ├── serve
│   ├── titanium
│   └── yo
|
├── 5) ruby gems
│   ├── compass
│   └── scss-lint
|
├── 6) apps
│   ├── appcleaner
│   ├── bettertouchtool
│   ├── caffeine
│   ├── diskmaker-x
│   ├── dropbox
│   ├── filezilla
│   ├── firefox
│   ├── firefox-nightly
│   ├── google-chrome
│   ├── google-chrome-canary
│   ├── handbrake
│   ├── handbrakecli
│   ├── ifunbox
│   ├── iterm2
│   ├── keepassx
│   ├── imageoptim
│   ├── licecap
│   ├── mactracker
│   ├── mplayer-osx-extended
│   ├── mysqlworkbench
│   ├── openemu
│   ├── sdformatter
│   ├── sequel-pro
│   ├── skype
│   ├── slack
│   ├── spotify
│   ├── sublime-text3
│   ├── teamviewer
│   ├── transmission
│   ├── trash-it
│   ├── tvrenamer
│   ├── virtualbox
│   ├── vagrant
│   └── vlc
|
└── 7) sublime text 3 packages
    ├── AlignTab
    ├── ApacheConf.tmLanguage
    ├── Babel
    ├── CSS3
    ├── DocBlockr
    ├── EditorConfig
    ├── FuzzyFilePath
    ├── Git Conflict Resolver
    ├── Gitignore
    ├── HTML Snippets
    ├── HTML Underscore Syntax
    ├── HTML5
    ├── Handlebars
    ├── Markdown Preview
    ├── Minify
    ├── nginx
    ├── Objective-C Autocompletion
    ├── Package Control
    ├── Random Everything
    ├── SCSS
    ├── Sass
    ├── SideBarEnhancements
    ├── SublimeLinter
    ├── SublimeLinter-contrib-clang
    ├── SublimeLinter-contrib-htmlhint
    ├── SublimeLinter-contrib-java
    ├── SublimeLinter-contrib-scss-lint
    ├── SublimeLinter-csslint
    ├── SublimeLinter-jshint
    ├── SublimeLinter-json
    ├── SublimeLinter-jsxhint
    ├── SublimeLinter-php
    ├── SublimeLinter-pylint
    ├── SublimeLinter-ruby
    ├── SublimeLinter-shellcheck
    └── Tag
```

## Thanks ##
This project was compiled from different dotfiles projects, so thank you all.
- [alrra/dotfiles](https://github.com/alrra/dotfiles)  
- [Couto/.dotfiles](https://github.com/Couto/.dotfiles)  
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)  
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles)  
