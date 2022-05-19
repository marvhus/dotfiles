# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ls colors
export LS_OPTIONS='--color=auto'
eval "`dircolors`"

# some more ls aliases
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -lha'
alias l='ls $LS_OPTIONS -lA'

# avoid making mistakes
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ctl
alias sctl='systemctl'
alias jctl='journalctl -xe'
alias bctl='bluetoothctl'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Custom path entries
export PATH="/opt/IntelliJ-IDEA/bin:$PATH"
export PATH="/opt/emacs/src:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/opt/JohnTheRipper/run:$PATH"
export PATH="/opt/ghidra:$PATH"
export PATH="/opt/sherlock/sherlock:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.cabal/bin/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="/opt/soundux/:$PATH"
# -----

# connect jbl headset
alias jblc="bluetoothctl connect (insert mac address for bluetooth device)"
alias jbldc="bluetoothctl disconnect (insert mac address for bluetooth device)"
alias jblrc="jbldc && jblc"
alias python="python3"
eval "$(thefuck --alias)"
alias youtube-dl="yt-dlp"
alias finish="source /opt/finish.sh"
export JOHN="/opt/JohnTheRipper"
alias emacs="emacsclient -c -a 'emacs'"
alias sgit="$HOME/src/py/sgit/main.py"
alias sherlock="python3 /opt/sherlock/sherlock/sherlock.py"
alias breach="python3 $HOME/.BREACH/breach.py"
alias rsactftool="python3 $HOME/.RsaCtfTool/RsaCtfTool.py"
alias neofetch="neofetch --ascii_distro debian --source ~/.config/neofetch/logos/saints2.txt"

####################
#### Styling - https://github.com/MokuKen/DOTS/blob/main/.bashrc
#####################

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Set a default prompt

# 2 Lines (Detail)
p1Det="\[\033[01;37m\]┌─[\[\033[01;32m\]\u\[\033[01;37m\]]-[\[\033[01;36m\]\H\[\033[01;37m\]]-[\[\033[01;33m\]\w\[\033[00;37m\]\[\033[01;37m\]]
\[\033[01;37m\]└─\[\e[91m\]\$(parse_git_branch)\[\033[1;33m\] >\[\033[0;37m\] "

# 1 Line (Minimal)
p1Min="\033[01;32m\]\u \[\033[01;33m\]\w \[\e[91m\]\$(parse_git_branch)\[\033[1;36m\]> \[\033[0;37m\]"

PS1=$p1Min

####################
####################
####################

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cryptex alias and path
export CRYPTEX_PATH="~/.Cryptex"
alias cryptex="python3 ~/.Cryptex/main.py"

# Start fish (so I can keep some bash configs)
fish
