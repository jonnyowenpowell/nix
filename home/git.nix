{ config, pkgs, ... }:

{
  # Git
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.git.enable
  # Aliases config in ./configs/git-aliases.nix
  programs.git.enable = true;

  programs.git.extraConfig = {
    # General
    core.autocrlf = "input";
    advice.addignoredfile = false;
    pull.rebase = true;
    init.defaultbranch = "main";

    # Helpers
    core.editor = "${pkgs.helix}/bin/hx";
    diff.colorMoved = "default";
    merge.conflictstyle = "diff3";

    # Signing
    commit.gpgsign = true;
    gpg.program = "${config.home.profileDirectory}/bin/gpg";
    tag.forcesignannotated = true;
    user.signingkey = "E1F65143FF8083FE";

    # Snyk
    url."git@github.com:snyk".insteadOf = "https://github.com/snyk";
  };

  programs.git.ignores = [
    ".DS_Store"
  ];

  programs.git.userEmail = config.home.user-info.email;
  programs.git.userName = config.home.user-info.fullName;

  # Enhanced diffs
  programs.git.delta = {
    enable = true;
    options = {
      navigate = true;
      line-numbers = true;
      side-by-side = true;
      syntax-theme = "base16";
    };
  };
}
