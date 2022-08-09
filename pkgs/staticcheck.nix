{ lib, buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "staticcheck";
  version = "0.3.3";

  src = fetchFromGitHub {
    owner = "dominikh";
    repo = "go-tools";
    rev = "v${version}";
    sha256 = "sha256-Yli+8gMoRRyNqOgFRv/uyFBVXdIlDH0tfZzvfTYBPyU=";
  };

  subPackages = [ "cmd/staticcheck" ];
  vendorSha256 = "sha256-19uLCtKuuZoVwC4SUKvYGWi2ryqAQbcKXY1iNjIqyn8=";

  doCheck = false;
}
