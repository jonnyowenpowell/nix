{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "gorename";
  version = "0.1.9";

  src = fetchFromGitHub {
    owner = "golang";
    repo = "tools";
    rev = "gorename/v${version}";
    sha256 = lib.fakeSha256;
  };

  modRoot = "cmd/gorename";
  vendorSha256 = lib.fakeSha256;

  doCheck = false;

  subPackages = [ "." ];
}
