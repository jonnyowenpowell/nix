{ config, pkgs, ... }:

{
  programs.gpg.agent = {
      enable = true;
      enableSSHSupport = true;
      defaultCacheTtl = 1800;
      extraConfig = ''
        pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
      '';
  };
}
