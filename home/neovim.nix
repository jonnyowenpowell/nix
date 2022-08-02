{ config, lib, pkgs, ... }:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (config.home.user-info) nixConfigDirectory;
in
{
  # Neovim
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.neovim.enable
  programs.neovim.enable = true;
  programs.neovim.vimAlias = true;
  programs.neovim.vimdiffAlias = true;

  xdg.configFile."nvim/lua/user".source = mkOutOfStoreSymlink "${nixConfigDirectory}/config/nvim";
  xdg.configFile.nvim = {
    source = pkgs.fetchFromGitHub {
      owner = "AstroNvim";
      repo = "AstroNvim";
      rev = "v1.7.0";
      sha256 = "sha256-ui2GqSOcCjT7PGaxWSfL3C1ryabmX+CC7vHFSgPLL8w=";
    };
    recursive = true;
  };
  programs.neovim.extraConfig = "lua require('init')";
}
