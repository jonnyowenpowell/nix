{ config, lib, pkgs, ... }:
let
  fillstruct = pkgs.callPackage ../pkgs/fillstruct.nix {};
  fillswitch = pkgs.callPackage ../pkgs/fillswitch.nix {};
  fixplurals = pkgs.callPackage ../pkgs/fixplurals.nix {};
  staticcheck = pkgs.callPackage ../pkgs/staticcheck.nix {};
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (config.home.user-info) nixConfigDirectory;
in
{
  # Alacritty
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    shell.program = "${pkgs.fish}/bin/fish";
    font.normal.family = "GoMono Nerd Font";
    font.size = 15.0;
    key_bindings = [
      { key = "A";         mods = "Alt";       chars = "/x1ba";  }
      { key = "B";         mods = "Alt";       chars = "/x1bb";  }
      { key = "C";         mods = "Alt";       chars = "/x1bc";  }
      { key = "D";         mods = "Alt";       chars = "/x1bd";  }
      { key = "E";         mods = "Alt";       chars = "/x1be";  }
      { key = "F";         mods = "Alt";       chars = "/x1bf";  }
      { key = "G";         mods = "Alt";       chars = "/x1bg";  }
      { key = "H";         mods = "Alt";       chars = "/x1bh";  }
      { key = "I";         mods = "Alt";       chars = "/x1bi";  }
      { key = "J";         mods = "Alt";       chars = "/x1bj";  }
      { key = "K";         mods = "Alt";       chars = "/x1bk";  }
      { key = "L";         mods = "Alt";       chars = "/x1bl";  }
      { key = "M";         mods = "Alt";       chars = "/x1bm";  }
      { key = "N";         mods = "Alt";       chars = "/x1bn";  }
      { key = "O";         mods = "Alt";       chars = "/x1bo";  }
      { key = "P";         mods = "Alt";       chars = "/x1bp";  }
      { key = "Q";         mods = "Alt";       chars = "/x1bq";  }
      { key = "R";         mods = "Alt";       chars = "/x1br";  }
      { key = "S";         mods = "Alt";       chars = "/x1bs";  }
      { key = "T";         mods = "Alt";       chars = "/x1bt";  }
      { key = "U";         mods = "Alt";       chars = "/x1bu";  }
      { key = "V";         mods = "Alt";       chars = "/x1bv";  }
      { key = "W";         mods = "Alt";       chars = "/x1bw";  }
      { key = "X";         mods = "Alt";       chars = "/x1bx";  }
      { key = "Y";         mods = "Alt";       chars = "/x1by";  }
      { key = "Z";         mods = "Alt";       chars = "/x1bz";  }
      { key = "A";         mods = "Alt|Shift"; chars = "/x1bA";  }
      { key = "B";         mods = "Alt|Shift"; chars = "/x1bB";  }
      { key = "C";         mods = "Alt|Shift"; chars = "/x1bC";  }
      { key = "D";         mods = "Alt|Shift"; chars = "/x1bD";  }
      { key = "E";         mods = "Alt|Shift"; chars = "/x1bE";  }
      { key = "F";         mods = "Alt|Shift"; chars = "/x1bF";  }
      { key = "G";         mods = "Alt|Shift"; chars = "/x1bG";  }
      { key = "H";         mods = "Alt|Shift"; chars = "/x1bH";  }
      { key = "I";         mods = "Alt|Shift"; chars = "/x1bI";  }
      { key = "J";         mods = "Alt|Shift"; chars = "/x1bJ";  }
      { key = "K";         mods = "Alt|Shift"; chars = "/x1bK";  }
      { key = "L";         mods = "Alt|Shift"; chars = "/x1bL";  }
      { key = "M";         mods = "Alt|Shift"; chars = "/x1bM";  }
      { key = "N";         mods = "Alt|Shift"; chars = "/x1bN";  }
      { key = "O";         mods = "Alt|Shift"; chars = "/x1bO";  }
      { key = "P";         mods = "Alt|Shift"; chars = "/x1bP";  }
      { key = "Q";         mods = "Alt|Shift"; chars = "/x1bQ";  }
      { key = "R";         mods = "Alt|Shift"; chars = "/x1bR";  }
      { key = "S";         mods = "Alt|Shift"; chars = "/x1bS";  }
      { key = "T";         mods = "Alt|Shift"; chars = "/x1bT";  }
      { key = "U";         mods = "Alt|Shift"; chars = "/x1bU";  }
      { key = "V";         mods = "Alt|Shift"; chars = "/x1bV";  }
      { key = "W";         mods = "Alt|Shift"; chars = "/x1bW";  }
      { key = "X";         mods = "Alt|Shift"; chars = "/x1bX";  }
      { key = "Y";         mods = "Alt|Shift"; chars = "/x1bY";  }
      { key = "Z";         mods = "Alt|Shift"; chars = "/x1bZ";  }
      { key = "Key1";      mods = "Alt";       chars = "/x1b1";  }
      { key = "Key2";      mods = "Alt";       chars = "/x1b2";  }
      { key = "Key3";      mods = "Alt";       chars = "/x1b3";  }
      { key = "Key4";      mods = "Alt";       chars = "/x1b4";  }
      { key = "Key5";      mods = "Alt";       chars = "/x1b5";  }
      { key = "Key6";      mods = "Alt";       chars = "/x1b6";  }
      { key = "Key7";      mods = "Alt";       chars = "/x1b7";  }
      { key = "Key8";      mods = "Alt";       chars = "/x1b8";  }
      { key = "Key9";      mods = "Alt";       chars = "/x1b9";  }
      { key = "Key0";      mods = "Alt";       chars = "/x1b0";  }
      { key = "Space";     mods = "Control";   chars = "/x00" ;  }
      { key = "Grave";     mods = "Alt";       chars = "/x1b`";  }
      { key = "Semicolon"; mods = "Alt";       chars = "/x1b;";  }
      { key = "Grave";     mods = "Alt|Shift"; chars = "/x1b~";  }
      { key = "Period";    mods = "Alt";       chars = "/x1b.";  }
      { key = "Key8";      mods = "Alt|Shift"; chars = "/x1b*";  }
      { key = "Key3";      mods = "Alt|Shift"; chars = "/x1b#";  }
      { key = "Period";    mods = "Alt|Shift"; chars = "/x1b>";  }
      { key = "Comma";     mods = "Alt|Shift"; chars = "/x1b<";  }
      { key = "Minus";     mods = "Alt|Shift"; chars = "/x1b_";  }
      { key = "Key5";      mods = "Alt|Shift"; chars = "/x1b%";  }
      { key = "Key6";      mods = "Alt|Shift"; chars = "/x1b^";  }
      { key = "Backslash"; mods = "Alt";       chars = "/x1b\\\\"; }
      { key = "Backslash"; mods = "Alt|Shift"; chars = "/x1b|";  }
    ];
  };

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

  xdg.configFile."helix/config.toml".source = mkOutOfStoreSymlink "${nixConfigDirectory}/config/helix/config.toml";

  home.packages = with pkgs; [
    # Development
    awscli
    cmake
    pkgs-stable.deno
    fnm
    helix
    gh
    k9s
    lazygit
    postgresql
    pkgs-stable.pgcli
    python310
    python310Packages.pip
    rlwrap
    teleport
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

    # k8s
    kubernetes-helm
    tilt

    # Utilities
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
