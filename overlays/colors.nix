# Colors from https://github.com/rebelot/kanagawa.nvim
# Used in Kitty terminal config: `./kitty-configs.nix`

# kanagawa       hex     base16 usage
# -------------- ------- ------ ---------------------------------------------------------------------------------
# fujiWhite      #dcd7ba   05   Default foreground
# oldWhite       #c8c093   04   Dark foreground (statuslines)
# sumiInk0       #16161d        Dark background (statuslines and floating windows)
# sumiInk1       #1f1f28   00   Default background
# sumiInk2       #2a2a37   01   Lighter background (colorcolumn, folds)
# sumiInk3       #363646   07   Lighter background (cursorline)
# sumiInk4       #54546d        Darker foreground (line numbers, fold column, non-text characters), float borders
# waveBlue1      #223249   02   Popup background, visual selection background
# waveBlue2      #2d4f67        Popup selection background, search background
# winterGreen    #2b3328        Diff Add (background)
# winterYellow   #49443c        Diff Change (background)
# winterRed      #43242b        Diff Deleted (background)
# winterBlue     #252535        Diff Line (background)
# autumnGreen    #76946a        Git Add
# autumnRed      #c34043   08   Git Delete
# autumnYellow   #dca561   0A   Git Change
# samuraiRed     #e82424        Diagnostic Error
# roninYellow    #ff9e3b        Diagnostic Warning
# waveAqua1      #6a9589        Diagnostic Info
# dragonBlue     #658594        Diagnostic Hint
# fujiGray       #727169   03   Comments
# springViolet1  #938aa9   06   Light foreground
# oniViolet      #957fb8   0E   Statements and Keywords
# crystalBlue    #7e9cd8   0D   Functions and Titles
# springViolet2  #9cabca        Brackets and punctuation
# springBlue     #7fb4ca   0C   Specials and builtin functions
# lightBlue      #a3d4d5        Not used
# waveAqua2      #7aa89f        Types
# springGreen    #98bb6c   0B   Strings
# boatYellow1    #938056        Not used
# boatYellow2    #c0a36e        Operators, RegEx
# carpYellow     #e6c384        Identifiers
# sakuraPink     #d27e99   0F   Numbers
# waveRed        #e46876        Standout specials 1 (builtin variables)
# peachRed       #ff5d62        Standout specials 2 (exception handling, return)
# surimiOrange   #ffa066   09   Constants, imports, booleans
# katanaGray     #717c7c        Deprecated

final: prev: {
  lib = prev.lib // {
    colors = {
      kanagawa = {
        fujiWhite = "dcd7ba";
        oldWhite = "c8c093";
        sumiInk0 = "16161d";
        sumiInk1 = "1f1f28";
        sumiInk2 = "2a2a37";
        sumiInk3 = "363646";
        sumiInk4 = "54546d";
        waveBlue1 = "223249";
        waveBlue2 = "2d4f67";
        winterGreen = "2b3328";
        winterYellow = "49443c";
        winterRed = "43242b";
        winterBlue = "252535";
        autumnGreen = "76946a";
        autumnRed = "c34043";
        autumnYellow = "dca561";
        samuraiRed = "e82424";
        roninYellow = "ff9e3b";
        waveAqua1 = "6a9589";
        dragonBlue = "658594";
        fujiGray = "727169";
        springViolet1 = "938aa9";
        oniViolet = "957fb8";
        crystalBlue = "7e9cd8";
        springViolet2 = "9cabca";
        springBlue = "7fb4ca";
        lightBlue = "a3d4d5";
        waveAqua2 = "7aa89f";
        springGreen = "98bb6c";
        boatYellow1 = "938056";
        boatYellow2 = "c0a36e";
        carpYellow = "e6c384";
        sakuraPink = "d27e99";
        waveRed = "e46876";
        peachRed = "ff5d62";
        surimiOrange = "ffa066";
        katanaGray = "717c7c";
      };
    };
  };
}
