
# common
alias .='ls -lahG';
alias ..='cd ../';
alias c='clear';
alias countf='ls | wc -l';
alias gi='gist -c -p -P -s -t js';
alias ip='dig +short myip.opendns.com @resolver1.opendns.com';
alias ips='ifconfig > /tmp/ip.txt && grep '\''inet '\'' /tmp/ip.txt';
alias l='ls -lahG';
alias hosts='sudo $EDITOR /etc/hosts';
alias flush="dscacheutil -flushcache"

# titanium
alias tbuild='titanium build --platform iphone --log-level info --retina --tall';
alias tbuild4='titanium build --platform iphone --log-level info --retina';
alias tbuildonly='titanium build -b -p ios --log-level info';
alias tdist='grunt device && titanium build --platform iphone --log-level info --target dist-adhoc';
