{ config, lib, pkgs, ... }:

{
  # Bat, a substitute for cat.
  # https://github.com/sharkdp/bat
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.bat.enable
  programs.bat.enable = true;
  programs.bat.config = {
    style = "plain";
  };

  home.packages = with pkgs; [
    # Development
    dotnet-sdk
    go

    # Nix
    comma
    niv

    # Utilities
    cloc
    coreutils
    docker
    du-dust
    exa
    fd
    gopass
    gopass-jsonapi
    go-task
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
