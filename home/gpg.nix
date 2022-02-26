{ config, pkgs, ... }:

{
  programs.gpg.enable = true;
  programs.gpg.settings = {
    pinentry-program = "${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac";
  };
}
