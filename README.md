# Nix

My nix setups

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
