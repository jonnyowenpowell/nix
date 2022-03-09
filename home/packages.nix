{ config, lib, pkgs, ... }:
let
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
  golines = pkgs.callPackage ../pkgs/golines.nix {};
  fillstruct = pkgs.callPackage ../pkgs/fillstruct.nix {};
  fillswitch = pkgs.callPackage ../pkgs/fillswitch.nix {};
  fixplurals = pkgs.callPackage ../pkgs/fixplurals.nix {};
in {
  # Bat, a substitute for cat.
  # https://github.com/sharkdp/bat
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.bat.enable
  programs.bat.enable = true;
  programs.bat.config = {
    style = "plain";
    theme = "base16";
  };

  # Direnv, load and unload environment variables depending on the current directory.
  # https://direnv.net
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.direnv.enable
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Go
  programs.go.enable = true;
  programs.go.goBin = "go/bin";
  programs.go.goPath = "go";

  home.packages = with pkgs; [
    # Development
    dotnet-sdk
    nodejs
    nodePackages.yarn

    # Neovim
    ## Language servers
    gopls
    omnisharp-roslyn

    ## go.nvim
    gofumpt
    gomodifytags
    gotests
    iferr
    impl
    delve
    richgo
    golines
    gotools
    fillstruct
    fillswitch
    fixplurals

    ## nvim-treesitter
    gcc
    tree-sitter

    # Nix
    comma
    niv
    nodePackages.node2nix

    # Utilities
    cloc
    coreutils
    docker
    du-dust
    exa
    fd
    gnupg
    gopass
    gopass-jsonapi
    go-task
    jq
    mosh
    procs
    ripgrep
    thefuck
    unrar
    wget
    xz
  ] ++ lib.optionals stdenv.isDarwin [
    cocoapods
    m-cli # useful macOS CLI commands
    prefmanager # tool for working with macOS defaults
  ];
}
