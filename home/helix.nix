{ config, lib, pkgs, ... }:
{
  # Helix: https://github.com/helix-editor/helix
  xdg.configFile."helix/config.toml".source = builtins.toFile "config.toml" (builtins.readFile ../config/helix/config.toml);
  xdg.configFile."helix/languages.toml".source = builtins.toFile "languages.toml" (builtins.readFile ../config/helix/languages.toml);
  xdg.configFile."helix/themes/kanagawa.toml".source = builtins.toFile "kanagawa.toml" (builtins.readFile ../config/helix/themes/kanagawa.toml);

  home.packages = with pkgs; [
    helix
  ];
}
