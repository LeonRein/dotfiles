#!/usr/bin/sh
if [ -f ~/.config/gnome-keyring-tpm-unlock/secret.tpm2 ]; then
  clevis decrypt tpm2 '{"pcrs":"7"}' < ~/.config/gnome-keyring-tpm-unlock/secret.tpm2 | gnome-keyring-daemon --replace --unlock
fi
