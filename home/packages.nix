{ config, lib, pkgs, ... }:

{
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
    azure-cli
    dotnet-sdk
    nodejs
    nodePackages.yarn

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
