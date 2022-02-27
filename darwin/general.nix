{ lib, pkgs, ... }:

{
  # Networking
  networking.dns = [
    "1.1.1.1"
    "8.8.8.8"
  ];

  programs.nix-index.enable = true;

  # Fonts
  fonts.enableFontDir = true;
  fonts.fonts = with pkgs; [
     recursive
     (nerdfonts.override { fonts = [ "JetBrainsMono Nerd Font Regular" ]; })
   ];

  # Keyboard
  system.keyboard.enableKeyMapping = true;

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;
}
