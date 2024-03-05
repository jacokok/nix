flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install com.raggesilver.BlackBox -y

# Font Fix
ln -s /run/current-system/sw/share/X11/fonts ~/.local/share/fonts
flatpak --user override --filesystem=$HOME/.local/share/fonts
flatpak --user override --filesystem=$HOME/.icons