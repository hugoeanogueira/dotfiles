
# load .bashrc .bash_aliases
if [ -f ~/.bashrc ]; then source ~/.bashrc; fi;
if [ -f ~/.bash_aliases ]; then source ~/.bash_aliases; fi;
if [ -f ~/.bash_prompt ]; then source ~/.bash_prompt; fi;
if [ -f ~/.exports ]; then source ~/.exports; fi;
if [ -f ~/.functions ]; then source ~/.functions; fi;
if [ -f ~/.inputrc ]; then source ~/.inputrc; fi;

export PATH=/usr/local/bin:/usr/local/sbin:$PATH;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# ADD EXTRA ALIASES
if [ -f ~/.bash_profile.extra ]; then source ~/.bash_profile.extra; fi;


# -------- Added by install.sh -------- #

[ -e "/Applications/MAMP/bin" ] && export PATH=/Applications/MAMP/bin:$PATH;

# autoenv
[ -e "/usr/local/opt/autoenv/activate.sh" ] && source "/usr/local/opt/autoenv/activate.sh";

# Start NVM, NPM and NodeJS
export NVM_DIR="$HOME/.nvm"
[ -e "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh";

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
[ -e "$PYENV_ROOT/bin" ] && eval "$(pyenv init -)"

# RbEnv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
[ -e "$RBENV_ROOT/bin" ] && eval "$(rbenv init -)"

# JEnv
export JENV_ROOT="$HOME/.jenv"
export PATH="$JENV_ROOT/bin:$PATH"
[ -e "$JENV_ROOT/bin" ] && eval "$(jenv init -)"

# Start Go
export GOPATH="$HOME/Go"
export GOROOT="/usr/local/opt/go/libexec"
PATH="$PATH:$GOPATH/bin"
PATH="$PATH:$GOROOT/bin"
[ -e "$GOPATH/go.sh" ] && source "$GOPATH/go.sh"

# rupa/z
if command -v brew >/dev/null 2>&1; then
    [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi
