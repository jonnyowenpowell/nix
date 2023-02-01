{ config, lib, pkgs, ... }:

let
  inherit (lib) optionalString;
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
    drb = "darwin-rebuild build --flake $(readlink ${nixConfigDirectory})";
    drs = "darwin-rebuild switch --flake $(readlink ${nixConfigDirectory})";
    dup = "nix flake update $(readlink ${nixConfigDirectory})";
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

  programs.fish.interactiveShellInit = ''
    set -g fish_greeting ""
    
    function fish_user_key_bindings
      fish_vi_key_bindings
    end

    set -g EDITOR "${pkgs.helix}/bin/hx"
  '' + optionalString (builtins.isString config.home.sessionVariables.GOBIN) ''
    fish_add_path ${config.home.sessionVariables.GOBIN}

    set -gx GITHUB_PRIVATE_TOKEN "$(security find-generic-password -a "$USER" -s "GitHub Token" -w)"
    set -gx NPM_TOKEN "$(security find-generic-password -a "$USER" -s "NPM Token" -w)"

    fnm env --use-on-cd | source
  '';
}
