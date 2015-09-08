
# load .bashrc .bash_aliases
if [ -f ~/.bashrc ]; then source ~/.bashrc; fi;
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi;
if [ -f ~/.bash_prompt ]; then . ~/.bash_prompt; fi;
if [ -f ~/.functions ]; then . ~/.functions; fi;
if [ -f ~/.inputrc ]; then . ~/.inputrc; fi;


export PATH=/usr/local/bin:/usr/local/sbin:$PATH;
export PATH=/Applications/MAMP/bin:$PATH;

export EDITOR='vim'
export VISUAL='subl'
export SVN_EDITOR=$VISUAL
export GIT_EDITOR=$EDITOR


# autoenv
source /usr/local/opt/autoenv/activate.sh

# Start NVM, NPM and NodeJS
export "NVM_DIR=$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# RbEnv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

# JEnv
export JENV_ROOT="$HOME/.jenv"
export PATH="$JENV_ROOT/bin:$PATH"
eval "$(jenv init -)"

# Start Go
export GOPATH="$HOME/Go"
export GOROOT="/usr/local/opt/go/libexec"
PATH="$PATH:$GOPATH/bin"
PATH="$PATH:$GOROOT/bin"
source "$GOPATH/go.sh"
