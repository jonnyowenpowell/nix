{ config, lib, pkgs, ... }:
let
  colima-bin = pkgs.callPackage ../pkgs/colima.nix { lima-bin = pkgs.lima-bin; };
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
  programs.go.package = pkgs.pkgs-master.go_1_20;
  programs.go.goBin = "go/bin";
  programs.go.goPath = "go";

  home.packages = with pkgs; [
    # Cloud
    aws-vault
    awscli
    gh

    # Compilers/Interpreters
    cmake
    pkgs-stable.deno
    fnm
    gcc
    python311
    rustup
    terraform
    nodePackages.typescript

    # Databases
    pkgs-stable.pgcli
    postgresql

    # Containers
    colima-bin
    docker-client
    k9s
    kubectl
    kubectx
    kubernetes-helm
    teleport
    tilt

    # Language Tools
    ## bash
    nodePackages.bash-language-server
    ## go
    delve
    gofumpt
    gopls
    ## nix
    nil
    ## rust
    rust-analyzer
    ## terraform
    terraform-ls
    ## typescript
    nodePackages.typescript-language-server
    nodePackages.vls
    ## python
    python310Packages.python-lsp-server
    ## yaml
    nodePackages.yaml-language-server

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
    home-manager
    jq
    ripgrep
    rlwrap
    unixtools.watch
    unrar
  ] ++ lib.optionals stdenv.isDarwin [
    m-cli
  ];
}
