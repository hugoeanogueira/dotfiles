# load .bashrc .bash_aliases
if [ -f ~/.bashrc ]; then source ~/.bashrc; fi;
if [ -f ~/.bash_aliases ]; then source ~/.bash_aliases; fi;
if [ -f ~/.bash_prompt ]; then source ~/.bash_prompt; fi;
if [ -f ~/.exports ]; then source ~/.exports; fi;
if [ -f ~/.functions ]; then source ~/.functions; fi;
if [ -f ~/.inputrc ]; then source ~/.inputrc; fi;

export PATH=/usr/local/bin:/usr/local/sbin:$PATH;

# Add homebrew to PATH
export PATH="/opt/homebrew/bin:$PATH";

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# ADD EXTRA ALIASES
if [ -f ~/.bash_profile.extra ]; then source ~/.bash_profile.extra; fi;


# -------- Added by install.sh -------- #

# autoenv
[ -e "/usr/local/opt/autoenv/activate.sh" ] && source "/usr/local/opt/autoenv/activate.sh";

# # PyEnv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# [ -e "$PYENV_ROOT/bin" ] && eval "$(pyenv init -)"

# # RbEnv
# export RBENV_ROOT="$HOME/.rbenv"
# export PATH="$RBENV_ROOT/bin:$PATH"
# export PATH="$RBENV_ROOT/shims:$PATH"
# [ -e "$RBENV_ROOT/bin" ] && eval "$(rbenv init -)"
# [ -e "$RBENV_ROOT/completions/rbenv.bash" ] && source "$RBENV_ROOT/completions/rbenv.bash";

#
# JAVA & JEnv
#
export JENV_ROOT="$HOME/.jenv"
export PATH="$JENV_ROOT/bin:$PATH"
[ -e "$JENV_ROOT/bin" ] && eval "$(jenv init -)"

# export default java version (java 11 arm)
JDK_8="/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/";
JDK_11="/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/";
JDK_13="/Library/Java/JavaVirtualMachines/adoptopenjdk-13.jdk/Contents/Home/";
JDK_11_ARM="/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home/";
JDK_21_ARM="/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home/";
export JAVA_HOME="$JDK_21_ARM";

alias jdk8="export JAVA_HOME=$JDK_8; java -version";
alias jdk11="export JAVA_HOME=$JDK_11; java -version";
alias jdk13="export JAVA_HOME=$JDK_13; java -version";
alias jdk11_arm="export JAVA_HOME=$JDK_11_ARM; java -version";
alias jdk21_arm="export JAVA_HOME=$JDK_21_ARM; java -version";

# expose openjdk@17 (arm) for compilers
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

# # Start Go
# export GOPATH="$HOME/Go"
# export GOROOT="/usr/local/opt/go/libexec"
# PATH="$PATH:$GOPATH/bin"
# PATH="$PATH:$GOROOT/bin"
# [ -e "$GOPATH/go.sh" ] && source "$GOPATH/go.sh"

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

# iTerm 2 shell integration (must run the install script)
# https://www.iterm2.com/documentation-shell-integration.html
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# # Android SDK/NDK
# export ANDROID_HOME="$HOME/Library/Android/sdk"
# export PATH="$ANDROID_HOME/ndk-bundle:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$PATH"

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

# export gcloud components bins
if [ -f "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc" ]; then
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
fi

# CS50 C configs
export CC="clang"
# export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcs50"
# export LDLIBS="-lcrypt -lcs50 -lm"

# Include headers to compile Protobuf files
export CXXFLAGS="-I/usr/local/include" LDFLAGS="-L/usr/local/lib"

# Initialize Rust's cargo
[ -e "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"


# Expose poerty bin (Python package manager)
export PATH="$HOME/.local/bin:$PATH"

# Expose Rye
source "$HOME/.rye/env"

# Expose psql
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# Expose idea shortcut
export PATH="/Applications/IntelliJ IDEA CE.app/Contents/MacOS:$PATH"
