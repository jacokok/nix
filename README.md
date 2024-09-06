# Nix

![NixOS](https://img.shields.io/badge/NixOS-Unstable-informational.svg?style=flat&logo=nixos)

## Install

```bash
#curl -sL https://raw.githubusercontent.com/jacokok/nix/master/install.sh | bash
curl -O /tmp/install.sh https://raw.githubusercontent.com/jacokok/nix/master/install.sh
# nixos-install --flake https://github.com/jacokok/nix.git#doink-laptop
```

## Setup

```bash
git clone https://github.com/jacokok/nix.git /tmp/nix
sudo nixos-rebuild switch --flake .#doink-laptop
```

## Dconf

```bash
dconf watch /
```

## Firewall

sudo nixos-firewall-tool open tcp 5173

## Update

```bash
sudo nixos-rebuild switch --flake .
```

## Sops

```bash
# Generate keys from ssh key
nix run nixpkgs#ssh-to-age -- -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt
# Get public key
nix shell nixpkgs#age -c age-keygen -y ~/.config/sops/age/keys.txt
```

## Vscode Extensions

```bash
nix run "github:nix-community/nix4vscode" -- home/programs/vscode/config.toml -o home/programs/vscode/vscode_plugins.nix
```
