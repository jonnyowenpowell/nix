{ pkgs, ... }:
{
  # Zellij: https://github.com/zellij-org/zellij
  xdg.configFile."zellij/config.kdl".source = builtins.toFile "config.kdl" (builtins.readFile ../config/zellij/config.kdl);

  home.packages = with pkgs; [
    pkgs-unstable.zellij
  ];
}
