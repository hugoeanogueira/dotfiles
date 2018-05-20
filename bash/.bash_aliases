# common
# alias .='ls -lahG';
alias ..='cd ../';
alias c='clear';
alias countf='ls | wc -l';
alias gi='gist -c -p -P -s -t js';
alias gs='git status';
alias gb='git branch';
alias grp='git rp';
alias ip='dig +short myip.opendns.com @resolver1.opendns.com';
alias ips='ifconfig > /tmp/ip.txt && grep '\''inet '\'' /tmp/ip.txt';
# alias l='ls -lahG';
alias hosts='sudo $EDITOR /etc/hosts';
alias flush="sudo killall -HUP mDNSResponder"

# projects
alias npm_reader="npm run frontend-compile-watch";

# fun
alias starwars="telnet towel.blinkenlights.nl";

# docker & kubernetes
alias dkps='docker ps -a';
alias dkstop='docker ps -aq | xargs docker stop';
alias dkrm='docker ps -aq | xargs docker rm';
alias kube_info='kubectl config view --minify';

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color";
else # OS X `ls`
    colorflag="-G";
fi;

# List all files colorized in long format
alias l="ls -lh ${colorflag}";

# List all files colorized in long format, including dot files
alias ll="ls -lah ${colorflag}";

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Show/hide hidden files in Finder
alias show_hidden="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide_hidden="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# ADD EXTRA ALIASES
if [ -f ~/.bash_aliases.extra ]; then source ~/.bash_aliases.extra; fi;
