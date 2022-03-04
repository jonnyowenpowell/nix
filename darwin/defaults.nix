{
  system.defaults.dock = {
    autohide = false;
    expose-group-by-app = true;
    mru-spaces = false;
    show-recents = false;
    mouse-over-hilite-stack = false;
    minimize-to-application = true;
    mineffect = "scale";
    tilesize = 32;
    # Disable all hot corners
    wvous-bl-corner = 1;
    wvous-br-corner = 1;
    wvous-tl-corner = 1;
    wvous-tr-corner = 1;
  };

  system.defaults.loginwindow = {
    GuestEnabled = false;
    DisableConsoleAccess = true;
  };

  system.defaults.spaces.spans-displays = false;

  system.defaults.trackpad = {
    Clicking = true;
    TrackpadRightClick = true;
  };

  system.defaults.finder = {
    FXEnableExtensionChangeWarning = true;
  };
}
