{ pkgs ? import <nixpkgs> {} }:

let
  easy-ps = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "e7075d13de7a31adc5762aca46650590d0e83a1f";
      sha256 = "0vczcvzis83m394vnvk5z2s76s2r9w7w7xfisfrvm3lvxxf02gf8";
    }
  ) {
    inherit pkgs;
  };

  spago2nix = import ./default.nix {
    inherit pkgs;
  };

in
pkgs.mkShell {
  buildInputs = [ easy-ps.purs spago2nix ];
}
