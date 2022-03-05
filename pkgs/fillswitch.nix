{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "fillswitch";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "davidrjenni";
    repo = "reftools";
    rev = "40322ffdc2e46fd7920d1f8250051bbd2f3bd34d";
    sha256 = "sha256-fHWtUoVK3G0Kn69O6/D0blM6Q/u4LuLinT6sxF18nFo=";
  };

  modRoot = "cmd/fillswitch";
  vendorSha256 = "sha256-pQpattmS9VmO3ZIQUFn66az8GSmB4IvYhTTCFn6SUmo=";

  doCheck = false;
}
