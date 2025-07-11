if test -f /usr/share/cachyos-fish-config/cachyos-config.fish
    source /usr/share/cachyos-fish-config/cachyos-config.fish
else
    set fish_greeting
end

set -x EDITOR helix

bind \e\e thefuck-command-line

if status is-interactive
    # Commands to run in interactive sessions can go here
    fenv source /etc/profile
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

set -x EXA_STANDARD_OPTIONS --group --header --group-directories-first --icons

alias hx="helix"

if test -e /opt/miniconda3/etc/fish/conf.d/conda.fish
    set -x CRYPTOGRAPHY_OPENSSL_NO_LEGACY
    source /opt/miniconda3/etc/fish/conf.d/conda.fish
end
