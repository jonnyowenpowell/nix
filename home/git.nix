{ config, pkgs, ... }:

{
  # Git
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.git.enable
  # Aliases config in ./configs/git-aliases.nix
  programs.git.enable = true;

  programs.git.extraConfig = {
    advice.addignoredfile = false;
    commit.gpgsign = true;
    core.editor = "${pkgs.neovim-remote}/bin/nvr --remote-wait-silent -cc split";
    core.autocrlf = "input";
    credential.helper = "osxkeychain";
    diff.colorMoved = "default";
    init.defaultbranch = "main";
    tag.forcesignannotated = true;
    user.signingkey = "E1F65143FF8083FE";
    pull.rebase = true;
  };

  programs.git.ignores = [
    ".DS_Store"
  ];

  programs.git.userEmail = config.home.user-info.email;
  programs.git.userName = config.home.user-info.fullName;

  # Enhanced diffs
  programs.git.delta.enable = true;
}
