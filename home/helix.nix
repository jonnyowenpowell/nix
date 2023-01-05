{ config, lib, pkgs, ... }:
let
  colors = import ./colors.nix;
in
{
  # Helix: https://github.com/helix-editor/helix
  xdg.configFile."helix/config.toml".source = builtins.toFile "config.toml" (builtins.readFile ../config/helix/config.toml);

  xdg.configFile."helix/themes/kanagawa.toml".source = builtins.toFile "kanagawa.toml" ''
    # fujiWhite
    "ui.text".fg = "fujiWhite"
    "ui.help".fg = "fujiWhite"
    "ui.cursor.insert".bg = "fujiWhite"

    # crystalBlue
    function = "crystalBlue"

    # oniViolet
    keyword = "oniViolet"
    "keyword.directive" = "oniViolet" # -- preprocessor comments (#if in C)
    tag = "oniViolet"

    # lightBlue
    namespace = "lightBlue"
    "markup.raw" = "lightBlue"

    # springViolet2
    punctuation = "springViolet2"
    "punctuation.delimiter" = "springViolet2"

    # boatYellow2
    operator = "boatYellow2"
    "function.macro" = "boatYellow2"
    "variable.other.member" = "boatYellow2"

    # peachRed
    special = "peachRed"
    "function.builtin" = "peachRed"

    # carpYellow
    variable = "carpYellow"
    "variable.parameter".fg = "carpYellow"

    # waveRed
    type.builtin = "waveRed"
    "variable.builtin" = "waveRed"
    "constant.builtin" = "waveRed"

    # waveAqua2
    type = "waveAqua2"

    # springBlue
    constructor = "springBlue"
    "constant.character.escape" = "springBlue"
    label = "springBlue" # used for lifetimes

    # fujiGray
    comment = "fujiGray"

    # surimiOrange
    "constant.numeric" = "surimiOrange"
    constant = "surimiOrange"

    # springGreen
    string = "springGreen"

    # oldWhite
    "markup.heading" = "oldWhite"
    "ui.background.separator".fg = "oldWhite"
    "ui.linenr.selected".fg = "oldWhite"
    "ui.statusline".fg = "oldWhite"
    "ui.statusline.insert".fg = "oldWhite"
    "ui.statusline.select".fg = "oldWhite"
    "ui.statusline.inactive".fg = "oldWhite"
    "ui.virtual.indent-guide".fg = "oldWhite"
    "ui.cursor.match".fg = "oldWhite"
    "ui.menu".fg = "oldWhite"
    "ui.menu.selected".fg = "oldWhite"
    "ui.menu.scroll".fg = "oldWhite"

    # katanaGray
    "markup.link.text" = "katanaGray"
    "ui.cursor.match".bg = "katanaGray"
    "ui.statusline.normal".fg = "katanaGray"

    # sumiInk4
    "markup.link.url".fg = "sumiInk4"
    "markup.link.url".modifiers = ["underlined"]
    "ui.linenr".fg = "sumiInk4"
    "ui.selection".bg = "sumiInk4"

    # autumnGreen
    "diff.plus" = "autumnGreen"

    # autumnRed
    "diff.minus" = "autumnRed"

    # autumnYellow
    "diff.delta" = "autumnYellow"

    # sumiInk1
    "ui.background".bg = "sumiInk1"

    # waveBlue1
    "ui.statusline".bg = "waveBlue1"
    "ui.popup".bg = "waveBlue1"

    # sumiInk0
    "ui.statusline.inactive".bg = "sumiInk0"
    "ui.menu.scroll".bg = "sumiInk0"

    # springViolet1
    "ui.window".fg = "springViolet1"
    "ui.text.focus".fg = "springViolet1"

    # waveBlue2
    "ui.help".bg = "waveBlue2"
    "ui.virtual".fg = "waveBlue2"
    "ui.highlight".bg = "waveBlue2"

    # sumiInk3
    "ui.selection.primary".bg = "sumiInk3"
    "ui.cursorline.primary".bg = "sumiInk3"
    "ui.menu.selected".bg = "sumiInk3"

    # sumiInk2
    "ui.cursor.select".bg = "sumiInk2"
    "ui.menu".bg = "sumiInk2"

    # dragonBlue
    "diagnostic.hint" = { underline = { color = "dragonBlue", style = "curl" } }
    hint = "dragonBlue"

    # waveAqua1
    "diagnostic.info" = { underline = { color = "waveAqua1", style = "curl" } }
    info = "waveAqua1"

    # roninYellow
    "diagnostic.warning" = { underline = { color = "roninYellow", style = "curl" } }
    warning = "roninYellow"

    # samuraiRed
    "diagnostic.error" = { underline = { color = "samuraiRed", style = "curl" } }
    error = "samuraiRed"

    # no color
    "markup.bold" = { modifiers = ["bold"] }
    "markup.italic" = { modifiers = ["italic"] }
    "ui.cursor" = { modifiers = ["reversed"] }

    [palette]
    fujiWhite = "#${colors.kanagawa.namedColors.fujiWhite}"
    oldWhite = "#${colors.kanagawa.namedColors.oldWhite}"
    sumiInk0 = "#${colors.kanagawa.namedColors.sumiInk0}"
    sumiInk1 = "#${colors.kanagawa.namedColors.sumiInk1}"
    sumiInk2 = "#${colors.kanagawa.namedColors.sumiInk2}"
    sumiInk3 = "#${colors.kanagawa.namedColors.sumiInk3}"
    sumiInk4 = "#${colors.kanagawa.namedColors.sumiInk4}"
    waveBlue1 = "#${colors.kanagawa.namedColors.waveBlue1}"
    waveBlue2 = "#${colors.kanagawa.namedColors.waveBlue2}"
    winterGreen = "#${colors.kanagawa.namedColors.winterGreen}"
    winterYellow = "#${colors.kanagawa.namedColors.winterYellow}"
    winterRed = "#${colors.kanagawa.namedColors.winterRed}"
    winterBlue = "#${colors.kanagawa.namedColors.winterBlue}"
    autumnGreen = "#${colors.kanagawa.namedColors.autumnGreen}"
    autumnRed = "#${colors.kanagawa.namedColors.autumnRed}"
    samuraiRed = "#${colors.kanagawa.namedColors.samuraiRed}"
    roninYellow = "#${colors.kanagawa.namedColors.roninYellow}"
    waveAqua1 = "#${colors.kanagawa.namedColors.waveAqua1}"
    dragonBlue = "#${colors.kanagawa.namedColors.dragonBlue}"
    fujiGray = "#${colors.kanagawa.namedColors.fujiGray}"
    springViolet1 = "#${colors.kanagawa.namedColors.springViolet1}"
    oniViolet = "#${colors.kanagawa.namedColors.oniViolet}"
    crystalBlue = "#${colors.kanagawa.namedColors.crystalBlue}"
    springViolet2 = "#${colors.kanagawa.namedColors.springViolet2}"
    springBlue = "#${colors.kanagawa.namedColors.springBlue}"
    lightBlue = "#${colors.kanagawa.namedColors.lightBlue}"
    waveAqua2 = "#${colors.kanagawa.namedColors.waveAqua2}"
    springGreen = "#${colors.kanagawa.namedColors.springGreen}"
    boatYellow1 = "#${colors.kanagawa.namedColors.boatYellow1}"
    boatYellow2 = "#${colors.kanagawa.namedColors.boatYellow2}"
    carpYellow = "#${colors.kanagawa.namedColors.carpYellow}"
    sakuraPink = "#${colors.kanagawa.namedColors.sakuraPink}"
    waveRed = "#${colors.kanagawa.namedColors.waveRed}"
    peachRed = "#${colors.kanagawa.namedColors.peachRed}"
    surimiOrange = "#${colors.kanagawa.namedColors.surimiOrange}"
    katanaGray = "#${colors.kanagawa.namedColors.katanaGray}"
  '';

  home.packages = with pkgs; [
    helix
  ];
}
