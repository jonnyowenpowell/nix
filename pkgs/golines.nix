{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "golines";
  version = "0.8.0";

  vendorSha256 = lib.fakeSha256;

  doCheck = false;

  src = fetchFromGitHub {
    owner = "segmentio";
    repo = "golines";
    rev = "v${version}";
    sha256 = "W4vN3rGKyX43HZyjjVUKnR4Fy0LfYqVf6h7wIYO0U50=";
  };
}
