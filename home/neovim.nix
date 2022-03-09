{ config, pkgs, lib, ... }:
let
  inherit (lib) getName mkIf optional;
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (config.home.user-info) nixConfigDirectory;

  # theme: kanagawa.nvim
  kanagawa-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "kanagawa.nvim";
    name = "kanagawa.nvim"; # https://github.com/rebelot/kanagawa.nvim
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "kanagawa.nvim";
      rev = "63cb5cc1a80def7da4bb375adee1587866250a17";
      sha256 = "sha256-TStFrx0u/MwSDcimvuwRRiyajkVq+rF5HWYCRsL4PCI=";
    };
  };

  # go.nvim
  go-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "go.nvim";
    name = "go.nvim"; # https://github.com/ray-x/go.nvim
    src = pkgs.fetchFromGitHub {
      owner = "ray-x";
      repo = "go.nvim";
      rev = "0fe0a9ee3367f7bd1e9c9ab30d5b7d5e66b83fc6";
      sha256 = "sha256-DyByErbti+bBr0IZMQLwpGgrRJsFUeFK7buJyFjj1NE=";
    };
  };
  guihua-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "guihua.lua";
    name = "guihua.lua"; # https://github.com/ray-x/guihua.lua
    src = pkgs.fetchFromGitHub {
      owner = "ray-x";
      repo = "guihua.lua";
      rev = "dc31428364809b4388c007c227e3d5d39f1e4395";
      sha256 = "sha256-Qi6aeHFrYChWbNr4sEE+6KPtTZSlmJRx2msYZK4Y/8s=";
    };
  };
in
{
  # Neovim
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.neovim.enable
  programs.neovim.enable = true;

  # Minimal init.vim config to load Lua config. Nix and Home Manager don't currently support
  # `init.lua`.
  xdg.configFile."nvim/lua".source = mkOutOfStoreSymlink "${nixConfigDirectory}/configs/nvim/lua";
  programs.neovim.extraConfig = "lua require('init')";

  programs.neovim.plugins = with pkgs.vimPlugins; [
    guihua-lua
    nvim-dap
    nvim-dap-ui
    nvim-dap-virtual-text
    nvim-lspconfig
    go-nvim
    kanagawa-nvim
    nvim-treesitter
    plenary-nvim
    telescope-nvim
  ];
}
