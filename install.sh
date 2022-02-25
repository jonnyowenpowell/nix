#!/bin/bash

# Create /run directory
echo -e "run\tprivate/var/run" | sudo tee -a /etc/synthetic.conf >/dev/null
/System/Library/Filesystems/apfs.fs/Contents/Resources/apfs.util -t &>/dev/null || true
# Build and switch to bootstrap config
nix build .#darwinConfigurations.bootstrap-x86.system
./result/sw/bin/darwin-rebuild switch --flake .#bootstrap-x86
darwin-rebuild switch --flake .#JonnyMacbookPro
