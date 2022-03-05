{ pkgs, ... }:

let
  golines = pkgs.callPackage ../pkgs/golines.nix {};
  # fillstruct = pkgs.callPackage ../pkgs/fillstruct.nix {};
  # fillswitch = pkgs.callPackage ../pkgs/fillswitch.nix {};
  # fixplurals = pkgs.callPackage ../pkgs/fixplurals.nix {};
  # goimports = pkgs.callPackage ../pkgs/goimports.nix {};
  # gorename = pkgs.callPackage ../pkgs/gorename.nix {};
in {
  programs.go.enable = true;
  programs.go.goBin = "go/bin";
  programs.go.goPath = "go";

  home.packages = with pkgs; home.packages ++ [
    gopls
    gofumpt
    gomodifytags
    gotests
    iferr
    impl
    delve
    richgo

    golines
    # fillstruct
    # fillswitch
    # fixplurals
    # goimports
    # gorename
  ];

  # For go.nvim
  programs.go.packages = {



    "golang.org/x/tools/cmd/goimports" = builtins.fetchGit { 
      url = "https://go.googlesource.com/tools";
      rev = "e155b03a0eccab1a0a9b476adc674d9b5034b6f5";
    };
    "golang.org/x/tools/cmd/gorename" = builtins.fetchGit { 
      url = "https://go.googlesource.com/tools";
      rev = "e155b03a0eccab1a0a9b476adc674d9b5034b6f5";
    };


    "github.com/davidrjenni/reftools/cmd/fillstruct" = builtins.fetchGit { 
      url = "https://github.com/davidrjenni/reftools";
      rev = "40322ffdc2e46fd7920d1f8250051bbd2f3bd34d";
    };
    "github.com/davidrjenni/reftools/cmd/fixplurals" = builtins.fetchGit { 
      url = "https://github.com/davidrjenni/reftools";
      rev = "40322ffdc2e46fd7920d1f8250051bbd2f3bd34d";
    };
    "github.com/davidrjenni/reftools/cmd/fillswitch" = builtins.fetchGit { 
      url = "https://github.com/davidrjenni/reftools";
      rev = "40322ffdc2e46fd7920d1f8250051bbd2f3bd34d";
    };

  };
}
