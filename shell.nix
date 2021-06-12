let pkgs = import <nixpkgs> {};
self = import ./default.nix {inherit pkgs; };
in pkgs.mkShell { buildInputs = with self; [ yo generator-code ]; }
