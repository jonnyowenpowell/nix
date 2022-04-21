{ config, lib, pkgs, ... }:
let
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

  # Go
  programs.go.enable = true;
  programs.go.package = pkgs.go_1_18;
  programs.go.goBin = "go/bin";
  programs.go.goPath = "go";

  home.packages = with pkgs; [
    # Development
    pkgs-stable.dotnet-sdk
    netlify-cli
    nodejs
    nodePackages.yarn
    terraform
    rust-bin.stable.latest.default

    # Neovim
    ## Language servers
    gopls

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
    # prefmanager # tool for working with macOS defaults
  ];
}
