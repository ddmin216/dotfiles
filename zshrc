#  _               _                _
# | |__   __ _ ___(_) ___   _______| |__  _ __ ___
# | '_ \ / _` / __| |/ __| |_  / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | (__   / /\__ \ | | | | | (__
# |_.__/ \__,_|___/_|\___| /___|___/_| |_|_|  \___|

# prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# profile
if [ -f ~/.profile ]; then
    . ~/.profile
fi

# history
HISTSIZE=1000
HISTFILESIZE=2000

# Set default editor
export EDITOR='vim'
export VISUAL='vim'

# alia-ls-es
alias l='ls -lhF --color=auto --group-directories-first'
alias ll='ls -lhF --color=auto --group-directories-first'
alias la='ls -lhAF --color=auto --group-directories-first'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# safer defaults
alias cp='cp -riv'
alias mv='mv -iv'
alias rm='rm -vI'
alias mkdir='mkdir -pv'

# vi mode
bindkey -v
export KEYTIMEOUT=20
bindkey -M viins 'jk' vi-cmd-mode

# navigate to directories with ranger
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# enable fzf search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# remap CTRL-T to CTRL-G for fzf
bindkey '^G' fzf-file-widget
bindkey '^T' transpose-chars

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
