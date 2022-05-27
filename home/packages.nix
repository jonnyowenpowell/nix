{ config, lib, pkgs, ... }:
let
  fillstruct = pkgs.callPackage ../pkgs/fillstruct.nix {};
  fillswitch = pkgs.callPackage ../pkgs/fillswitch.nix {};
  fixplurals = pkgs.callPackage ../pkgs/fixplurals.nix {};
  golines = pkgs.callPackage ../pkgs/golines.nix {};
  staticcheck = pkgs.callPackage ../pkgs/staticcheck.nix {};
in {
  # Bat, a substitute for cat.
  # https://github.com/sharkdp/bat
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.bat.enable
  programs.bat.enable = true;
  programs.bat.config = {
    style = "plain";
    theme = "base16";
  };

  # Go
  programs.go.enable = true;
  programs.go.package = pkgs.go_1_18;
  programs.go.goBin = "go/bin";
  programs.go.goPath = "go";

  # Python
  programs.matplotlib.enable = true;

  home.packages = with pkgs; [
    # Development
    pkgs-stable.dotnet-sdk
    netlify-cli
    nodejs
    nodePackages.yarn
    python310
    terraform
    rust-bin.stable.latest.default


    # Neovim
    ## Language servers
    gopls

    ## go.nvim
    delve
    fillstruct
    fillswitch
    fixplurals
    gofumpt
    golines
    gomodifytags
    gotests
    gotools
    go-outline
    iferr
    impl
    richgo
    staticcheck

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
    ngrok
    procs
    ripgrep
    thefuck
    unrar
    wget
    xz
  ] ++ lib.optionals stdenv.isDarwin [
    cocoapods
    m-cli # useful macOS CLI commands
    # prefmanager # tool for working with macOS defaults
  ];
}
