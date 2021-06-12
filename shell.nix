let
  pkgs = import <nixpkgs> {};
  self = import ./nix { inherit pkgs; };
  combined = pkgs.symlinkJoin { name = "yo-code"; paths = with self; [ yo generator-code pkgs.nodejs-12_x ]; };
in
pkgs.mkShell { buildInputs = [ combined ]; }
