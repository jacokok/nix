# Update flake
nix flake update

# Build
sudo nixos-rebuild build --flake .
sudo nixos-rebuild build --flake . --option eval-cache false
sudo nixos-rebuild build --flake . --option show-trace true --option eval-cache false

# sudo nixos-rebuild boot
# sudo poweroff --reboot
# sudo nix-collect-garbage -d
# sudo /run/current-system/bin/switch-to-configuration boot
# sudo nixos-rebuild switch --flake .#doink-laptop
# sudo nixos-rebuild switch --flake .#doink
# sudo nixos-rebuild switch --flake .
# sudo nixos-rebuild build --flake . --option eval-cache false

sudo nixos-rebuild build --flake . --option show-trace true --option eval-cache fals

sudo nixos-rebuild switch --flake . --option eval-cache false

# sudo nixos-rebuild build --flake . --option eval-cache false
nh os switch -u .