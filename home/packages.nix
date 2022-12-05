{ config, lib, pkgs, ... }:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (config.home.user-info) nixConfigDirectory;
in
{
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
  programs.go.package = pkgs.go_1_19;
  programs.go.goBin = "go/bin";
  programs.go.goPath = "go";

  # Helix: https://github.com/helix-editor/helix
  xdg.configFile."helix/config.toml".source = mkOutOfStoreSymlink "${nixConfigDirectory}/config/helix/config.toml";

  home.packages = with pkgs; [
    # Cloud
    awscli
    gh

    # Compilers/Interpreters
    cmake
    pkgs-stable.deno
    fnm
    gcc
    python311
    rust-analyzer
    (rust-bin.stable.latest.default.override {
        extensions = [ "rust-src" "rustfmt" ];
    })
    terraform

    # Databases
    pkgs-stable.pgcli
    postgresql

    # Editor
    helix

    # Kubernetes
    k9s
    kubernetes-helm
    teleport
    tilt

    # Language Tools
    ## go
    delve
    gofumpt
    gopls
    ## rust

    # Networking
    mosh
    ngrok
    wget

    # Security
    gnupg
    pkgs-stable.gopass
    pkgs-stable.gopass-jsonapi
    
    # Utilities
    cloc
    coreutils
    exa
    go-task
    jq
    ripgrep
    rlwrap
    unrar
  ] ++ lib.optionals stdenv.isDarwin [
    m-cli
  ];
}
