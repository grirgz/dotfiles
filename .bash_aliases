alias cp='cp -i'
alias mv='mv -i'
alias ks='apt search'
alias ki='sudo apt install'
alias kd='apt show'
alias kp='sudo apt purge'
alias kL='dpkg -L'
alias js='jack_control start'
alias jk='jack_control stop'
alias jd='jack_control status'
alias jl='~/bin/jack_startup'
alias jp='pulseaudio'
alias jpk='pulseaudio -k'
alias df='df -h'
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
function grepr { grep --color=always -R "$1" . | less -R -F; }
function ksl { unbuffer apt search $@ | less -R; }

. ~/dotfiles/bash_init.sh

alias mradd='mr run git add . ; mr commit'

alias killfox='pkill firefox && sleep 2 && firefox &'
