# shell environment for generating bin/output.js
# Usage:
#
#     nix-shell mkbin.nix
#

{ pkgs ? import <nixpkgs> {}
, nodejs ? pkgs.nodejs-10_x
}:

  let
    easy-purescript-nix = import (
      pkgs.fetchFromGitHub {
        owner = "justinwoo";
        repo = "easy-purescript-nix";
        rev = "e7075d13de7a31adc5762aca46650590d0e83a1f";
        sha256 = "0vczcvzis83m394vnvk5z2s76s2r9w7w7xfisfrvm3lvxxf02gf8";
      }
    ) {
      inherit pkgs;
    };

  in
    pkgs.mkShell {
      nativeBuildInputs = [
        easy-purescript-nix.purs
        easy-purescript-nix.spago
        nodejs
      ];
      shellHook = ''
        npm install
        npm run mkbin
        exit 0
      '';
    }
