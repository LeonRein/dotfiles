if test -f /usr/share/cachyos-fish-config/cachyos-config.fish
    source /usr/share/cachyos-fish-config/cachyos-config.fish
else
    set fish_greeting
end

# Homebrew (z. B. im Webtop-Container), nur wenn vorhanden
if test -x /home/linuxbrew/.linuxbrew/bin/brew
    /home/linuxbrew/.linuxbrew/bin/brew shellenv fish | source
end

# Arch/CachyOS: helix, Debian: hx
if command -q helix
    set -x EDITOR helix
else
    set -x EDITOR hx
end

# Eigene Pfade hinten an PATH anfügen, damit System- und Paketmanager-Programme Vorrang haben.
# -P: direkt PATH statt der universellen fish_user_paths (die fish immer VOR PATH stellt),
# -a: hinten anfügen, -m: schon vorhandene Einträge (z. B. alte fish_user_paths) nach hinten verschieben.
# (z. B. legt Webtop ~/.local/bin/bwrap -> proot an, das sonst das echte bubblewrap verdeckt)
fish_add_path -aPm ~/.cargo/bin
fish_add_path -aPm ~/.local/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
    functions -q fenv; and fenv source /etc/profile

    functions -q thefuck-command-line; and bind alt-f thefuck-command-line

    set -x EXA_STANDARD_OPTIONS --group --header --group-directories-first --icons

    command -q helix; and alias hx="helix"
    alias zac="zellij attach -c"

    command -q jj; and jj util completion fish | source

    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    if test -e ~/export-esp.sh
        source ~/export-esp.sh
    end
end
