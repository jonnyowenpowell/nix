{ config, lib, pkgs, ... }:
let
  fillstruct = pkgs.callPackage ../pkgs/fillstruct.nix {};
  fillswitch = pkgs.callPackage ../pkgs/fillswitch.nix {};
  fixplurals = pkgs.callPackage ../pkgs/fixplurals.nix {};
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

  home.packages = with pkgs; [
    # Development
    pkgs-stable.deno
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

    # Utilities
    alacritty
    cloc
    coreutils
    du-dust
    exa
    fd
    gnupg
    pkgs-stable.gopass
    pkgs-stable.gopass-jsonapi
    go-task
    jq
    mosh
    ngrok
    procs
    ripgrep
    unrar
    wget
    xz
  ] ++ lib.optionals stdenv.isDarwin [
    cocoapods
    m-cli
  ];
}
