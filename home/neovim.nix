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
  xdg.configFile.nvim = {
    source = pkgs.fetchFromGitHub {
      owner = "AstroNvim";
      repo = "AstroNvim";
      rev = "v2.4.2";
      sha256 = "sha256-rw29hZKFklXdeA3viyYuHH92aaTmmuzdmrM/EbsFpSQ=";
    };
    recursive = true;
  };
  programs.neovim.extraConfig = "";
}
