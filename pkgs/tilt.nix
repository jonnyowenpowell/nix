{ lib
, pkgs
, buildGoModule
, fetchFromGitHub
}:

let 
  pkgSrc = fetchFromGitHub {
    owner = "tilt-dev";
    repo = "tilt";
    rev = "8cddf4d852ce2bd027d3d577796be179a3f24380";
    hash = "sha256-GkcP5cICPzbRJWN6ysueqedhED/MQaqcP9p2qXqpTII=";
  };
  tilt-ui = pkgs.mkYarnPackage {
    name = "tilt-ui";
    src = "${pkgSrc}/web";
  };
in
buildGoModule rec {
  pname = "tilt";
  /* Do not use "dev" as a version. If you do, Tilt will consider itself
    running in development environment and try to serve assets from the
    source tree, which is not there once build completes.  */
  version = "0.33.6";

  src = pkgSrc;

  vendorHash = null;

  buildInputs = [ pkgs.yarn tilt-ui ];

  subPackages = [ "cmd/tilt" ];

  ldflags = [ "-X main.version=${version}" ];

  preBuild = ''
    cp -R ${tilt-ui}/libexec/tilt-ui/node_modules web/node_modules
    chmod -R 777 web/node_modules
    ${pkgs.yarn}/bin/yarn --cwd web build
    cp -r web/build/* pkg/assets/build
  '';

  meta = {
    description = "Local development tool to manage your developer instance when your team deploys to Kubernetes in production";
    homepage = "https://tilt.dev/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ anton-dessiatov ];
  };
}
