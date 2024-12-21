set fish_greeting

bind \e\e thefuck-command-line

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# source "$HOME/.cargo/env.fish"

set -x EXA_STANDARD_OPTIONS --group --header --group-directories-first --icons

alias hx="helix"
