# dotfiles

## Installation ##
You may either run the `_/scripts/install.sh` to install all dotfiles and
remaining software in a new developing machine, or cherry-pick what to install
from the scripts directory and each configuration folder.

To install all in a new machine (without git):
```
mkdir dotfiles; cd dotfiles; curl -L 'https://github.com/hugoeanogueira/dotfiles/tarball/master' | tar -xz --strip-components 1 && ./_scripts/install.sh
```

To install only the dotfiles (without git)
```
mkdir dotfiles; cd dotfiles; curl -L 'https://github.com/hugoeanogueira/dotfiles/tarball/master' | tar -xz --strip-components 1 && ./_scripts/install_1_dotfiles.sh
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
│   ├── osx
│   ├── sublime
│   ├── tmux
│   └── vim
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
├── 4) npm global packages
├── 5) ruby gems
├── 6) apps
└── 7) sublime text 3 packages
```

## Thanks ##
This project was compiled from different dotfiles projects, so thank you all.
- [alrra/dotfiles](https://github.com/alrra/dotfiles)  
- [Couto/.dotfiles](https://github.com/Couto/.dotfiles)  
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)  
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles)  
