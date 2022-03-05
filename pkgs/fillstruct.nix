{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "fillstruct";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "davidrjenni";
    repo = "reftools";
    rev = "40322ffdc2e46fd7920d1f8250051bbd2f3bd34d";
    sha256 = lib.fakeSha256;
  };

  modRoot = "cmd/fillstruct";
  vendorSha256 = lib.fakeSha256;

  doCheck = false;
}
