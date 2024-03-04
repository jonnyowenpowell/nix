{ lib, pkgs, ... }:
let
  oras = pkgs.callPackage ../pkgs/oras.nix {};
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
  programs.go.package = pkgs.pkgs-unstable.go_1_22;
  programs.go.goBin = "go/bin";
  programs.go.goPath = "go";

  home.packages = with pkgs; [
    # Cloud
    aws-vault
    awscli2
    gh

    # Compilers/Interpreters
    bun
    cmake
    deno
    fnm
    # j -- build is broken
    pythonWithPackages
    rustup
    terraform
    nodePackages.typescript

    # Databases
    pgcli
    postgresql_15

    # Containers
    k9s
    ko
    kubectx
    kubernetes-helm
    pkgs-unstable.kubeshark
    oras
    skopeo
    pkgs-unstable.teleport
    pkgs-master.tilt

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

    # Shell
    pkgs-unstable.nushell 
    
    # Utilities
    autoconf
    automake
    circleci-cli
    cloc
    coreutils
    eza
    exercism
    go-task
    gnuplot
    graphviz
    home-manager
    jq
    pkgs-unstable.k6
    kcat
    lsix
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
