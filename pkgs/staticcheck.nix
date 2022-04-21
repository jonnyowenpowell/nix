{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "staticcheck";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "dominikh";
    repo = "go-tools";
    rev = "v${version}";
    sha256 = "sha256-GyNYNyX/hJyj6F5zCc60obai/SRCsdSczmtuvD3pzX0=";
  };

  subPackages = [ "cmd/staticcheck" ];
  vendorSha256 = "sha256-aOtNjWHQUN2iD26PvJEKpOCog72L9mXFXcsJiusGm20=";

  doCheck = false;
}
