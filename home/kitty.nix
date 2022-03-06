{ config, lib, pkgs, ... }:

{
  # Kitty terminal
  # https://sw.kovidgoyal.net/kitty/conf.html
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.kitty.enable
  programs.kitty.enable = true;

  programs.kitty.settings = with pkgs.lib.colors.kanagawa; {
    font_family = "Menlo";
    font_size = "14.0";
    adjust_line_height = "140%";
    disable_ligatures = "cursor";

    # Window layout
    hide_window_decorations = "titlebar-only";
    window_padding_width = "10";

    # Tab bar
    tab_bar_edge = "top";
    tab_bar_style = "powerline";
    tab_title_template = "Tab {index}: {title}";
    active_tab_font_style = "bold";
    inactive_tab_font_style = "normal";
    tab_activity_symbol = "";

    # Colors
    background = sumiInk1;
    foreground = fujiWhite;
    selection_background = waveBlue2;
    selection_foreground = oldWhite;
    url_color = springBlue;
    cursor = oldWhite;
    active_tab_background = waveBlue2;
    active_tab_foreground = fujiWhite;
    inactive_tab_background = waveBlue1;
    inactive_tab_foreground = fujiGray;
    tab_bar_background = sumiInk2;
    color0 = sumiInk0;
    color1 = autumnRed;
    color2 = autumnGreen;
    color3 = boatYellow2;
    color4 = crystalBlue;
    color5 = oniViolet;
    color6 = waveAqua1;
    color7 = oldWhite;
    color8 = fujiGray;
    color9 = samuraiRed;
    color10 = springGreen;
    color11 = carpYellow;
    color12 = springBlue;
    color13 = springViolet1;
    color14 = waveAqua2;
    color15 = fujiWhite;
    color16 = surimiOrange;
    color17 = peachRed;
  };

  programs.kitty.extras.useSymbolsFromNerdFont = "JetBrainsMono Nerd Font";
}
