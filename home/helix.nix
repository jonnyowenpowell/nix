{ config, lib, pkgs, ... }:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (config.home.user-info) nixConfigDirectory;
  colors = import ./colors.nix;
in
{
  # Helix: https://github.com/helix-editor/helix
  xdg.configFile."helix/config.toml".source = builtins.toFile "config.toml" (builtins.readFile ../config/helix/config.toml);

  xdg.configFile."helix/themes/kanagawa.toml".source = builtins.toFile "kanagawa.toml" ''
    attribute = "crystalBlue"
    keyword = "oniViolet"
    "keyword.directive" = "oniViolet" # -- preprocessor comments (#if in C)
    namespace = "lightBlue"
    punctuation = "springViolet2"
    "punctuation.delimiter" = "springViolet2"
    operator = "boatYellow2"
    special = "peachRed"
    "variable.other.member" = "boatYellow2"
    variable = "carpYellow"
    # variable = "almond" # TODO: metavariables only
    # "variable.parameter" = { fg = "lavender", modifiers = ["underlined"] }
    "variable.parameter" = { fg = "carpYellow" }
    "variable.builtin" = "waveRed"
    type = "waveAqua2"
    "type.builtin" = "waveRed" # TODO: distinguish?
    constructor = "springBlue"
    function = "crystalBlue"
    "function.macro" = "boatYellow2"
    "function.builtin" = "peachRed"
    tag = "oniViolet"
    comment = "fujiGray"
    constant = "surimiOrange"
    "constant.builtin" = "waveRed"
    string = "springGreen"
    "constant.numeric" = "surimiOrange"
    "constant.character.escape" = "springBlue"
    # used for lifetimes
    label = "springBlue"

    "markup.heading" = "oldWhite"
    "markup.bold" = { modifiers = ["bold"] }
    "markup.italic" = { modifiers = ["italic"] }
    "markup.link.url" = { fg = "sumiInk4", modifiers = ["underlined"] }
    "markup.link.text" = "katanaGray"
    "markup.raw" = "lightBlue"

    "diff.plus" = "autumnGreen"
    "diff.minus" = "autumnRed"
    "diff.delta" = "autumnYellow"

    "ui.background" = { bg = "sumiInk1" }
    "ui.background.separator" = { fg = "oldWhite" }
    "ui.linenr" = { fg = "sumiInk4" }
    "ui.linenr.selected" = { fg = "oldWhite" }
    "ui.statusline" = { fg = "oldWhite", bg = "waveBlue1" }
    "ui.statusline.inactive" = { fg = "oldWhite", bg = "sumiInk0" }
    "ui.popup" = { bg = "waveBlue1" }
    "ui.window" = { fg = "springViolet1" }
    "ui.help" = { bg = "waveBlue2", fg = "fujiWhite" }

    "ui.text" = { fg = "fujiWhite" }
    "ui.text.focus" = { fg = "springViolet1" }
    "ui.virtual" = { fg = "waveBlue2" }

    "ui.virtual.indent-guide" = { fg = "oldWhite" }

    "ui.selection" = { bg = "sumiInk4" }
    "ui.selection.primary" = { bg = "sumiInk3" }
    # TODO: namespace ui.cursor as ui.selection.cursor?
    "ui.cursor.select" = { bg = "sumiInk2" }
    "ui.cursor.insert" = { bg = "fujiWhite" }
    "ui.cursor.match" = { fg = "oldWhite", bg = "katanaGray" }
    "ui.cursor" = { modifiers = ["reversed"] }
    "ui.cursorline.primary" = { bg = "sumiInk3" }
    "ui.highlight" = { bg = "waveBlue2" }

    "ui.menu" = { fg = "oldWhite", bg = "sumiInk2" }
    "ui.menu.selected" = { fg = "oldWhite", bg = "sumiInk3" }
    "ui.menu.scroll" = { fg = "oldWhite", bg = "sumiInk0" }

    "diagnostic.hint" = { underline = { color = "dragonBlue", style = "curl" } }
    "diagnostic.info" = { underline = { color = "waveAqua1", style = "curl" } }
    "diagnostic.warning" = { underline = { color = "roninYellow", style = "curl" } }
    "diagnostic.error" = { underline = { color = "samuraiRed", style = "curl" } }

    warning = "roninYellow"
    error = "samuraiRed"
    info = "waveAqua1"
    hint = "dragonBlue"

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
