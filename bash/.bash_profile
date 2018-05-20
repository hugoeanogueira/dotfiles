
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

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
[ -e "$PYENV_ROOT/bin" ] && eval "$(pyenv init -)"

# RbEnv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
export PATH="$RBENV_ROOT/shims:$PATH"
[ -e "$RBENV_ROOT/bin" ] && eval "$(rbenv init -)"
[ -e "$RBENV_ROOT/completions/rbenv.bash" ] && source "$RBENV_ROOT/completions/rbenv.bash";

#
# JAVA & JEnv
#
export JENV_ROOT="$HOME/.jenv"
export PATH="$JENV_ROOT/bin:$PATH"
[ -e "$JENV_ROOT/bin" ] && eval "$(jenv init -)"

# configure aliases to change java versions
export JAVA_6_HOME="/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home";
export JAVA_8_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home";

alias java_6='export JAVA_HOME=$JAVA_6_HOME';
alias java_8='export JAVA_HOME=$JAVA_8_HOME';

# export default java version (java 8)
export JAVA_HOME=$JAVA_8_HOME;


# Start Go
export GOPATH="$HOME/Go"
export GOROOT="/usr/local/opt/go/libexec"
PATH="$PATH:$GOPATH/bin"
PATH="$PATH:$GOROOT/bin"
[ -e "$GOPATH/go.sh" ] && source "$GOPATH/go.sh"

# configure macos gem
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# rupa/z
if command -v brew >/dev/null 2>&1; then
    [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# Start NVM, NPM and NodeJS
export NVM_DIR="$HOME/.nvm"
[ -e "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh";

# # nvbn/thefuck
# eval "$(thefuck --alias)"

# iTerm 2 shell integration (must run the install script)
# https://www.iterm2.com/documentation-shell-integration.html
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Android SDK/NDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/ndk-bundle:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$PATH"

##
# BASH AUTOCOMPLETE
#

# brew autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
source $(brew --prefix)/etc/bash_completion > /dev/null
fi

# git autocomplete
if [ -f "$HOME/.git_completion.bash" ]; then
source "$HOME/.git_completion.bash" > /dev/null
fi

# maven autocomplete
if [ -f "$HOME/.maven_completion.bash" ]; then
source "$HOME/.maven_completion.bash" > /dev/null
fi

# glcoud autocomplete
if [ -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc" ]; then
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc" > /dev/null
fi

# export mysql
export PATH="/usr/local/opt/mysql@5.5/bin:$PATH"
