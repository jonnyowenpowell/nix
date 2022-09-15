{ config, lib, pkgs, ... }:

let
  inherit (lib) elem optionalString;
  inherit (config.home.user-info) nixConfigDirectory;
in
{
  # Fish Shell
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.fish.enable
  programs.fish.enable = true;

  # Add Fish plugins
  home.packages = [ pkgs.fishPlugins.done ];

  # Aliases
  programs.fish.shellAliases = with pkgs; {
    # Nix related
    drb = "darwin-rebuild build --flake ${nixConfigDirectory}";
    drs = "darwin-rebuild switch --flake ${nixConfigDirectory}";
    dup = "nix flake update ${nixConfigDirectory}";
    nb = "nix build";
    nd = "nix develop";
    nf = "nix flake";
    nr = "nix run";
    ns = "nix search";

    # Other
    ".." = "cd ..";
    ":q" = "exit";
    cat = "${bat}/bin/bat";
    du = "${du-dust}/bin/dust";
    g = "${gitAndTools.git}/bin/git";
    gtask = "task -d (git rev-parse --show-toplevel)";
    la = "ll -a";
    ll = "ls -l --time-style long-iso --icons";
    ls = "${exa}/bin/exa";
    ps = "${procs}/bin/procs";
    tb = "toggle-background";
    dcu = "docker compose up -d";
    yaegi = "rlwrap yaegi";
  };

  # Configuration that should be above `loginShellInit` and `interactiveShellInit`.
  programs.fish.shellInit = ''
    set -U fish_term24bit 1
  '';

  programs.fish.interactiveShellInit = with pkgs.lib.colors.kanagawa; ''
    set -g fish_greeting ""
    ${pkgs.thefuck}/bin/thefuck --alias | source
    
    function fish_user_key_bindings
      fish_vi_key_bindings
    end

    # Set Fish colors
    set -l foreground ${fujiWhite}
    set -l selection ${waveBlue2}
    set -l comment ${fujiGray}
    set -l red ${autumnRed}
    set -l orange ${surimiOrange}
    set -l yellow ${boatYellow2}
    set -l green ${autumnGreen}
    set -l purple ${oniViolet}
    set -l cyan ${waveAqua2}
    set -l pink ${sakuraPink}

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment

    set -g EDITOR "${pkgs.neovim}/bin/nvim"
  '' + optionalString (builtins.isString config.home.sessionVariables.GOBIN) ''
    fish_add_path ${config.home.sessionVariables.GOBIN}

    set -gx GITHUB_PRIVATE_TOKEN "$(security find-generic-password -a "$USER" -s "GitHub Token" -w)"
    set -gx NPM_TOKEN "$(security find-generic-password -a "$USER" -s "NPM Token" -w)"

    fnm env --use-on-cd | source
  '';
}
