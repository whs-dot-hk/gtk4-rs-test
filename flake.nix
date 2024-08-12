{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = {
    flake-utils,
    self,
    nixpkgs,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
        with pkgs; {
          packages.default = rustPlatform.buildRustPackage {
            buildInputs = [gtk4];
            cargoHash = "sha256-n51bCrHs1Vvpwad48/jrFZfCF5HOv9J0pfS3dciVWcU=";
            nativeBuildInputs = [pkg-config];
            pname = "test";
            src = ./.;
            version = "1.0.0";
          };
        }
    );
}
