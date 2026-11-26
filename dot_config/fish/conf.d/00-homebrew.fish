# Homebrew (z. B. im Webtop-Container), nur wenn vorhanden.
# Liegt in conf.d mit "00", damit es vor den Plugins (zoxide, atuin, thefuck ...) geladen wird;
# config.fish käme dafür zu spät.
if test -x /home/linuxbrew/.linuxbrew/bin/brew
    /home/linuxbrew/.linuxbrew/bin/brew shellenv fish | source
end
