{
  programs.go.enable = true;

  # For go.nvim
  programs.go.packages = {
    "github.com/mvdan/gofumpt" = builtins.fetchGit {
      url = "https://github.com/mvdan/gofumpt";
      rev = "2becf2f780ca0a0a7d9ac92b12d733c30072afca";
    };
    "github.com/segmentio/golines" = builtins.fetchGit { 
      url = "https://github.com/segmentio/golines";
      rev = "e6e2cf00858666ca672e2fe0753f8a2584cc3ee8";
    };
    "golang.org/x/tools/gopls" = builtins.fetchGit { 
      url = "https://go.googlesource.com/tools";
      rev = "e155b03a0eccab1a0a9b476adc674d9b5034b6f5";
    };
    "golang.org/x/tools/cmd/goimports" = builtins.fetchGit { 
      url = "https://go.googlesource.com/tools";
      rev = "e155b03a0eccab1a0a9b476adc674d9b5034b6f5";
    };
    "golang.org/x/tools/cmd/gorename" = builtins.fetchGit { 
      url = "https://go.googlesource.com/tools";
      rev = "e155b03a0eccab1a0a9b476adc674d9b5034b6f5";
    };
    "github.com/fatih/gomodifytags" = builtins.fetchGit { 
      url = "https://github.com/fatih/gomodifytags";
      ref = "main";
      rev = "46cec66387fdf90cbc2b9f584d86e9ca8692ad7e";
    };
    "github.com/cweill/gotests" = builtins.fetchGit { 
      url = "https://github.com/cweill/gotests";
      ref = "main";
      rev = "07c9be90195c734c55b3c659b2950ebdca435e23";
    };
    "github.com/koron/iferr" = builtins.fetchGit { 
      url = "https://github.com/koron/iferr";
      rev = "bb332a3b1d9129b6486c7ddcb7030c11b05cfc88";
    };
    "github.com/josharian/impl" = builtins.fetchGit { 
      url = "https://github.com/josharian/impl";
      rev = "15605c5dec6b261fa991d37dce8fb84c74017c56";
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
    "github.com/go-delve/delve" = builtins.fetchGit { 
      url = "https://github.com/go-delve/delve";
      rev = "23612165e7dc03c758f95cdea4147ea3ea05e6cd";
    };
    "github.com/kyoh86/richgo" = builtins.fetchGit { 
      url = "https://github.com/kyoh86/richgo";
      ref = "main";
      rev = "fc2aa3593d0f1108edf2d0bc6a2f03d79313b6de";
    };
  };
}
