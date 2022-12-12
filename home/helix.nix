{ config, lib, pkgs, ... }:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (config.home.user-info) nixConfigDirectory;
in
{
  # Helix: https://github.com/helix-editor/helix
  xdg.configFile."helix/config.toml".source = mkOutOfStoreSymlink "${nixConfigDirectory}/config/helix/config.toml";

  home.packages = with pkgs; [
    helix
  ];
}
