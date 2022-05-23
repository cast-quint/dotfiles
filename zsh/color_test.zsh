#!/bin/zsh

for cc in $(seq -w 0 255); do
    print -P "$cc: %B%F{blue}[~/dotfiles]%f %F{$cc}(main)%f %F{green}$%f%b"
done
