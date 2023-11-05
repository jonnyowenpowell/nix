{ pkgs, ... }:
{
  # Helix: https://github.com/helix-editor/helix
  xdg.configFile."helix/config.toml".source = builtins.toFile "config.toml" (builtins.readFile ../config/helix/config.toml);
  xdg.configFile."helix/languages.toml".source = builtins.toFile "languages.toml" (builtins.readFile ../config/helix/languages.toml);

  home.packages = with pkgs; [
    pkgs-unstable.helix
  ];
}
