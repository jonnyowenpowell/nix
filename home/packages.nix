{ config, lib, pkgs, ... }:


    # "github.com/davidrjenni/reftools/cmd/fillstruct" = builtins.fetchGit { 
    #   url = "https://github.com/davidrjenni/reftools";
    #   rev = "40322ffdc2e46fd7920d1f8250051bbd2f3bd34d";
    # };
    # "github.com/davidrjenni/reftools/cmd/fixplurals" = builtins.fetchGit { 
    #   url = "https://github.com/davidrjenni/reftools";
    #   rev = "40322ffdc2e46fd7920d1f8250051bbd2f3bd34d";
    # };
    # "github.com/davidrjenni/reftools/cmd/fillswitch" = builtins.fetchGit { 
    #   url = "https://github.com/davidrjenni/reftools";
    #   rev = "40322ffdc2e46fd7920d1f8250051bbd2f3bd34d";
    # };

let
  golines = pkgs.callPackage ../pkgs/golines.nix {};
  goimports = pkgs.callPackage ../pkgs/goimports.nix {};
  gorename = pkgs.callPackage ../pkgs/gorename.nix {};
  # fillstruct = pkgs.callPackage ../pkgs/fillstruct.nix {};
  # fillswitch = pkgs.callPackage ../pkgs/fillswitch.nix {};
  # fixplurals = pkgs.callPackage ../pkgs/fixplurals.nix {};
in {
  # Bat, a substitute for cat.
  # https://github.com/sharkdp/bat
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.bat.enable
  programs.bat.enable = true;
  programs.bat.config = {
    style = "plain";
  };

  # Direnv, load and unload environment variables depending on the current directory.
  # https://direnv.net
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.direnv.enable
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.go.enable = true;
  programs.go.goBin = "go/bin";
  programs.go.goPath = "go";

  home.packages = with pkgs; [
    # Development
    dotnet-sdk
    nodejs
    nodePackages.yarn
    ## Go
    pkgs.gopls
    pkgs.gofumpt
    pkgs.gomodifytags
    pkgs.gotests
    pkgs.iferr
    pkgs.impl
    pkgs.delve
    pkgs.richgo

    golines
    goimports
    gorename
    # fillstruct
    # fillswitch
    # fixplurals

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
