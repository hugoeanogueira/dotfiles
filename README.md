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
mkdir dotfiles; cd dotfiles; curl -L 'https://github.com/hugoeanogueira/dotfiles/tarball/master' | tar -xz --strip-components 1 && ./_scripts/install_dotfiles.sh
```

## Thanks ##
This project was compiled from different dotfiles projects, so thank you all.
- [alrra/dotfiles](https://github.com/alrra/dotfiles)  
- [Couto/.dotfiles](https://github.com/Couto/.dotfiles)  
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)  
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles)  
