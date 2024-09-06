# Nix

![NixOS](https://img.shields.io/badge/NixOS-Unstable-informational.svg?style=flat&logo=nixos)

## Installation

### Git Clone

```bash
git clone https://github.com/jacokok/nix.git && cd nix
```

### Install Nix:

```bash
sudo nixos-rebuild switch --flake .#doink-laptop
sudo nixos-rebuild switch --flake .#doink-desktop
sudo nixos-rebuild switch --flake .
```