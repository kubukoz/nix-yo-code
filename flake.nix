{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell =
          pkgs.mkShell {
            buildInputs = [
              pkgs.nodePackages.yo
              pkgs.nodePackages.generator-code
              pkgs.nodejs-16_x
            ];
          };
      }
    );
}
