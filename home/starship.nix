{ pkgs, ... }:

{
  # Starship Prompt
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.starship.enable
  programs.starship.enable = true;

  programs.starship.settings = {
    # See docs here: https://starship.rs/config/
    # Symbols config configured ./starship-symbols.nix.

    character.success_symbol = "[➜](bold green) ";
    character.vicmd_symbol = "[ ](bold green) ";
    character.error_symbol = "[✗](bold red) ";

    directory.fish_style_pwd_dir_length = 1; # turn on fish directory truncation
    directory.truncation_length = 2; # number of directories not to truncate

    hostname.style = "bold green"; # don't like the default

    memory_usage.disabled = true; # because it includes cached memory it's reported as full a lot

    username.style_user = "bold blue"; # don't like the default
  };
}
