{ config, lib, pkgs, ... }:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (config.home.user-info) nixConfigDirectory;
in
{
  # Neovim
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.neovim.enable
  programs.neovim.enable = true;
  programs.neovim.package = pkgs.neovim-unwrapped;
  programs.neovim.vimAlias = true;
  programs.neovim.vimdiffAlias = true;

  xdg.configFile."nvim/lua/user".source = mkOutOfStoreSymlink "${nixConfigDirectory}/config/nvim";
  xdg.configFile."nvim/lua" = {
    source = pkgs.fetchFromGitHub {
      owner = "AstroNvim";
      repo = "AstroNvim";
      rev = "v1.8.1";
      sha256 = "sha256-OwO8wxgBcGxJ3ekhbI7rPc6zpD9T9Hjs7Gv11jc9pYg=";
    };
    recursive = true;
  };
  programs.neovim.extraConfig = "lua require('init')";
}
