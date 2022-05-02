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

# python
alias python="python3"
# nvim
alias nvim="nvim.appimage"

# Set a default prompt

# 2 Lines (Detail)
p1Det='\[\033[01;37m\]┌─[\[\033[01;32m\]\u\[\033[01;37m\]]-[\[\033[01;36m\]\H\[\033[01;37m\]]-[\[\033[01;33m\]\w\[\033[00;37m\]\[\033[01;37m\]]
\[\033[01;37m\]└─\[\033[1;33m\] >\[\033[0;37m\] '

# 1 Line (Minimal)
p1Min='\[\033[01;32m\]\u \[\033[01;33m\]\w \[\033[1;36m\]> \[\033[0;37m\]'

PS1=$p1Min
