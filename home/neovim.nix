{ config, pkgs, lib, ... }:
let
  inherit (lib) getName mkIf optional;
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (config.home.user-info) nixConfigDirectory;

  pluginWithDeps = plugin: deps: plugin.overrideAttrs (_: { dependencies = deps; });

  nonVSCodePluginWithConfig = plugin: {
    plugin = plugin;
    optional = true;
    config = ''
      if !exists('g:vscode')
        lua require('jonny.' .. string.gsub('${plugin.pname}', '%.', '-'))
      endif
    '';
  };

  nonVSCodePlugin = plugin: {
    plugin = plugin;
    optional = true;
    config = ''if !exists('g:vscode') | packadd ${plugin.pname} | endif'';
  };

  # https://github.com/ray-x/go.nvim
  go-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "go.nvim";
    name = "go.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "ray-x";
      repo = "go.nvim";
      rev = "0fe0a9ee3367f7bd1e9c9ab30d5b7d5e66b83fc6";
      sha256 = "sha256-DyByErbti+bBr0IZMQLwpGgrRJsFUeFK7buJyFjj1NE=";
    };
  };

  # https://github.com/ray-x/guihua.lua
  guihua-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "guihua.lua";
    name = "guihua.lua";
    src = pkgs.fetchFromGitHub {
      owner = "ray-x";
      repo = "guihua.lua";
      rev = "dc31428364809b4388c007c227e3d5d39f1e4395";
      sha256 = "sha256-Qi6aeHFrYChWbNr4sEE+6KPtTZSlmJRx2msYZK4Y/8s=";
    };
  };

  # theme
  # https://github.com/mcchrish/zenbones.nvim
  zenbones-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "zenbones.nvim";
    name = "zenbones.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "mcchrish";
      repo = "zenbones.nvim";
      rev = "1e0b792efd4cee41c8005d6b61a6e1f91a630c6b";
      sha256 = "sha256-L9velRUwXaf6QhAx6gqsZT3Zf3LzuEKNUvLIvLyovmM=";
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
    (pluginWithDeps zenbones-nvim [ lush-nvim ])
    moses-nvim
    tabular
    vim-commentary
    vim-eunuch
    vim-haskell-module-name
    vim-surround
  ] ++ map (p: { plugin = p; optional = true; }) [
    telescope-symbols-nvim
    telescope-z-nvim
    which-key-nvim
    zoomwintab-vim
  ] ++ map nonVSCodePlugin [
    agda-vim
    copilot-vim
    direnv-vim
    goyo-vim
    vim-fugitive
  ] ++ map nonVSCodePluginWithConfig [
    editorconfig-vim
    (pluginWithDeps galaxyline-nvim [ nvim-web-devicons ])
    gitsigns-nvim
    (pluginWithDeps go-nvim [ guihua-lua nvim-dap nvim-dap-ui nvim-dap-virtual-text ])
    indent-blankline-nvim
    lspsaga-nvim
    (pluginWithDeps bufferline-nvim [ nvim-web-devicons ])
    (pluginWithDeps nvim-compe [ compe-tabnine ])
    nvim-lspconfig
    nvim-treesitter
    (pluginWithDeps telescope-nvim [ nvim-web-devicons ])
    vim-floaterm
    vim-pencil
    vim-polyglot
  ];

  # From personal addon module `../modules/home/programs/neovim/extras.nix`
  programs.neovim.extras.termBufferAutoChangeDir = true;
  programs.neovim.extras.nvrAliases.enable = true;
  # }}}

  programs.neovim.extraPackages = with pkgs; [
    neovim-remote
    gcc # needed for nvim-treesitter
    tree-sitter # needed for nvim-treesitter

    # Language servers
    # See `../configs/nvim/lua/jonny/nvim-lspconfig.lua` for configuration.
    ccls
    nodePackages.bash-language-server
    nodePackages.vim-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.yaml-language-server
    rnix-lsp
  ] ++ optional (pkgs.stdenv.system != "x86_64-darwin") sumneko-lua-language-server;
}
