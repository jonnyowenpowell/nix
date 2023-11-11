{ config, pkgs, ... }:

let
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
    g = "${git}/bin/git";
    gtask = "task -d (git rev-parse --show-toplevel)";
    jhs = "jconsole ~/j903-user/config/jhs.cfg";
    la = "ll -a";
    ll = "ls -l --time-style long-iso --icons";
    ls = "${exa}/bin/exa";
    ps = "${procs}/bin/procs";
    tb = "toggle-background";
    dcu = "docker compose up -d";
    yaegi = "rlwrap yaegi";
    espdev = "exec bash -c \"source ~/export-esp.sh; exec fish\"";

    # Teleport
    tshl = "tsh login --proxy \"$SNYK_TELEPORT_PROXY\" \"$SNYK_TELEPORT_CLUSTER\"";
    tshfda = "tsh login --proxy \"$SNYK_TELEPORT_FD_ALPHA_PROXY\" \"$SNYK_TELEPORT_FD_ALPHA_CLUSTER\"";
    tshfdp = "tsh login --proxy \"$SNYK_TELEPORT_FD_PROD_PROXY\" \"$SNYK_TELEPORT_FD_PROD_CLUSTER\"";
  };

  programs.fish.shellInit = ''
    set -U fish_term24bit 1
  '';

  programs.fish.interactiveShellInit = ''
    function fish_user_key_bindings
      fish_vi_key_bindings
    end

    function add_paths
      fish_add_path "${config.home.homeDirectory}/.cargo/bin"

      fish_add_path "${config.home.homeDirectory}/.ghcup/bin"
      fish_add_path "${config.home.homeDirectory}/.cabal/bin"

      fish_add_path "${config.home.sessionVariables.GOBIN}"

      fish_add_path "${config.home.homeDirectory}/.local/bin"
    end

    function set_universal_variables
      set -U SENTINAL_UNIVERSAL_VARIABLE 1

      set -U fish_greeting ""
      set -U EDITOR "${pkgs.helix}/bin/hx"
      set -Ux AWS_SDK_JS_SUPPRESS_MAINTENANCE_MODE_MESSAGE 1

      set -Ux GITHUB_PRIVATE_TOKEN "$(gopass show dev/github.com/token)"

      set -Ux NPM_TOKEN "$(gopass show snyk/npmjs.com/token)"
      set -Ux STELLA_GITHUB_TOKEN "$(gopass show snyk/github.com/stella_token)"
      set -Ux SNYK_INTERNAL_PROXY_HOST "$(gopass show snyk/internal_proxy/host)"
      set -Ux SNYK_INTERNAL_PROXY_CREDENTIALS "$(gopass show snyk/internal_proxy/credentials)"
      set -Ux SNYK_TELEPORT_PROXY "$(gopass show snyk/teleport/proxy)"
      set -Ux SNYK_TELEPORT_CLUSTER "$(gopass show snyk/teleport/cluster)"
      set -Ux SNYK_TELEPORT_FD_ALPHA_PROXY "$(gopass show snyk/teleport/fd_alpha_proxy)"
      set -Ux SNYK_TELEPORT_FD_ALPHA_CLUSTER "$(gopass show snyk/teleport/fd_alpha_cluster)"
      set -Ux SNYK_TELEPORT_FD_PROD_PROXY "$(gopass show snyk/teleport/fd_prod_proxy)"
      set -Ux SNYK_TELEPORT_FD_PROD_CLUSTER "$(gopass show snyk/teleport/fd_prod_cluster)"
    end

    add_paths
    if test -z "$SENTINAL_UNIVERSAL_VARIABLE"
      set_universal_variables
    end

    fnm env --use-on-cd | source
  '';
}
