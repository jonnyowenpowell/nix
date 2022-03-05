{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "golines";
  version = "0.8.0";

  vendorSha256 = null;

  doCheck = false;

  src = fetchFromGitHub {
    owner = "segmentio";
    repo = "golines";
    rev = "v${version}";
  };
}
