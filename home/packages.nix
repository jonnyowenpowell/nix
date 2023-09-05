{ lib, pkgs, ... }:
let
  oras = pkgs.callPackage ../pkgs/oras.nix {};
  tiltLocal = pkgs.callPackage ../pkgs/tilt.nix {};
  pythonWithPackages = pkgs.python311.withPackages (p: with p; [
    pip
    python-lsp-server
  ]);
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
  programs.go.package = pkgs.go_1_20;
  programs.go.goBin = "go/bin";
  programs.go.goPath = "go";

  home.packages = with pkgs; [
    # Cloud
    aws-vault
    awscli
    gh

    # Compilers/Interpreters
    bun
    cmake
    deno
    fnm
    jdk
    pythonWithPackages
    terraform
    nodePackages.typescript

    # Databases
    pgcli
    postgresql_15

    # Containers
    pkgs-unstable.colima
    pkgs-unstable.docker-client
    k9s
    ko
    kubectl
    kubectx
    kubernetes-helm
    oras
    skopeo
    teleport
    tiltLocal

    # Language Tools
    ## bash
    nodePackages.bash-language-server
    ## nix
    nil
    ## terraform
    terraform-ls
    ## typescript
    nodePackages.typescript-language-server
    nodePackages.vls
    ## yaml
    nodePackages.yaml-language-server

    # Libraries
    libiconv

    # Networking
    mosh
    ngrok
    wget

    # Security
    gnupg
    gopass
    gopass-jsonapi
    
    # Utilities
    autoconf
    automake
    circleci-cli
    cloc
    coreutils
    exa
    go-task
    gnuplot
    graphviz
    home-manager
    jq
    nmap
    ripgrep
    rlwrap
    unixtools.watch
    unrar
    yq-go
  ] ++ lib.optionals stdenv.isDarwin [
    m-cli
  ];
}
