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
  programs.go.package = pkgs.pkgs-master.go_1_20;
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
    pkgs-stable.pgcli
    postgresql

    # Containers
    colima
    docker-client
    k9s
    kubectl
    kubectx
    kubernetes-helm
    oras
    skopeo
    teleport
    tilt

    # Language Tools
    ## bash
    nodePackages.bash-language-server
    ## go
    pkgs-master.delve
    gofumpt
    gopls
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
    pkgs-stable.gopass
    pkgs-stable.gopass-jsonapi
    
    # Utilities
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
  ] ++ lib.optionals stdenv.isDarwin [
    m-cli
  ];
}
