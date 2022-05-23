# auto-completion settings

# load more completions
fpath+="$ZDOTDIR/zsh/plugins/zsh-completions/src"

# load the complist module
zmodload zsh/complist

# Use hjlk in menu selection (during completion)
# Doesn't work well with interactive mode
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# use the main completer '_complete'
zstyle ':completion:*' completer _complete

# turn the cache on and configure its location
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

# turn on the completion menu
zstyle ':completion:*' menu select

# autocomplete options for cd
zstyle ':completion:*' complete-options true

# color output when suggesting files in list format, similar to ls --color=auto
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# load compinit
autoload -Uz compinit

# check zcompdump once a day to shave off startup time
#for dump in $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION(N.mh+24); do
#    compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
#done

# and the usual call to compaudit (-C)
compinit -C
