{
  # Starship Prompt
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.starship.enable
  programs.starship.enable = true;

  programs.starship.settings = {
    # See docs here: https://starship.rs/config/
    # Symbols config configured ./starship-symbols.nix.

    hostname.style = "bold green";
    username.style_user = "bold blue";

    character.success_symbol = "[➜](bold green) ";
    character.vicmd_symbol = "[ ](bold green) ";
    character.error_symbol = "[✗](bold red) ";

    command_timeout = 500;

    directory.fish_style_pwd_dir_length = 1; # turn on fish directory truncation
    directory.truncation_length = 2; # number of directories not to truncate

    memory_usage.disabled = true;
    battery.disabled = true;
  };
}
