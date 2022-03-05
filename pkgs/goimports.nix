{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "goimports";
  version = "0.1.9";

  src = fetchFromGitHub {
    owner = "golang";
    repo = "tools";
    rev = "v${version}";
    sha256 = "jIWFzfByho+uocQVrb0TMWErsxJniLYMAoPjp3178e4=";
  };

  modRoot = "cmd/goimports";
  vendorSha256 = lib.fakeSha256;

  doCheck = false;

  subPackages = [ "." ];
}
