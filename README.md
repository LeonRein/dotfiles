# Dotfiles
Managed by [chezmoi](https://github.com/twpayne/chezmoi).

## Set up new machine
```
# paru kommt auf CachyOS aus dem Repo; auf reinem Arch paru-bin aus dem AUR bauen
sudo pacman -S --needed paru
paru -Sy chezmoi
# legt u. a. ~/.config/paru/paru.conf mit dem PKGBUILD-Repo [leonrein] an
chezmoi init --apply
paru -Sy --pkgbuilds

# AppImages: Gear Lever installiert/aktualisiert sie (topgrade-Schritt "gearlever")
flatpak install flathub it.mijorus.gearlever
xdg-mime default it.mijorus.gearlever.desktop application/vnd.appimage application/x-iso9660-appimage
```
