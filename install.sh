#!/bin/bash

sh <(curl -L https://nixos.org/nix/install)
# Create /run directory
echo -e "run\tprivate/var/run" | sudo tee -a /etc/synthetic.conf >/dev/null
/System/Library/Filesystems/apfs.fs/Contents/Resources/apfs.util -t &>/dev/null || true
# Build and switch to bootstrap config
nix build .#darwinConfigurations.bootstrap-arm.system
./result/sw/bin/darwin-rebuild switch --flake .#bootstrap-arm
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
darwin-rebuild switch --flake .#JonnyPowellMacBook

