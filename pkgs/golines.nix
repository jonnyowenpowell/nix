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
    sha256 = "1wmzl5sk5mc46njzn86007sqyyv6han058ppiw536qyhk88rzazq";
  };
}
