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
    la = "ll -a";
    ll = "ls -l --time-style long-iso --icons";
    ls = "${exa}/bin/exa";
    ps = "${procs}/bin/procs";
    tb = "toggle-background";
    dcu = "docker compose up -d";
    yaegi = "rlwrap yaegi";
  };

  programs.fish.shellInit = ''
    set -U fish_term24bit 1
  '';

  programs.fish.interactiveShellInit = ''
    set -g fish_greeting ""
    
    function fish_user_key_bindings
      fish_vi_key_bindings
    end

    set -g EDITOR "${pkgs.helix}/bin/hx"
    fish_add_path "${config.home.homeDirectory}"/.cargo/bin
    fish_add_path ${config.home.sessionVariables.GOBIN}

    set -x DOCKER_HOST unix://{$HOME}/.colima/docker.sock    
    set -gx AWS_SDK_JS_SUPPRESS_MAINTENANCE_MODE_MESSAGE 1

    set -gx GITHUB_PRIVATE_TOKEN "$(gopass show dev/github.com/token)"

    fnm env --use-on-cd | source
  ''
  # Snyk
  + ''
    set -gx NPM_TOKEN "$(gopass show snyk/npmjs.com/token)"
    set -gx SNYK_INTERNAL_PROXY_HOST "$(gopass show snyk/internal_proxy/host)"
    set -gx SNYK_INTERNAL_PROXY_CREDENTIALS "$(gopass show snyk/internal_proxy/credentials)"

    abbr --add tshl tsh login --proxy="$(gopass show snyk/teleport/proxy)" "$(gopass show snyk/teleport/host)"
    abbr --add tshfda tsh login --proxy="$(gopass show snyk/teleport/fd_alpha_proxy)" "$(gopass show snyk/teleport/fd_alpha_host)"
    abbr --add tshfdp tsh login --proxy="$(gopass show snyk/teleport/fd_prod_proxy)" "$(gopass show snyk/teleport/fd_prod_host)"
  '';
}
