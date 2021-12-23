{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-21.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell =
          let
            self = import ./nix { inherit pkgs; };
          in
          pkgs.mkShell {
            buildInputs = [
              self.yo
              self.generator-code
              pkgs.nodejs-12_x
            ];
          };
      }
    );
}
