# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

{
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  brl-cad = pkgs.callPackage ./pkgs/brl-cad.nix { };
  defold = pkgs.callPackage ./pkgs/defold.nix { };
  dxhd = pkgs.callPackage ./pkgs/dxhd.nix { };
  edir = pkgs.callPackage ./pkgs/edir.nix { };
  flavours = pkgs.callPackage ./pkgs/flavours.nix { };
  hantemcli = pkgs.callPackage ./pkgs/hantemcli.nix { };
  hypermail = pkgs.callPackage ./pkgs/hypermail.nix { };
  julia-bin = pkgs.callPackage ./pkgs/julia-bin.nix { };
  license-cli = pkgs.callPackage ./pkgs/license-cli.nix { };
  openring = pkgs.callPackage ./pkgs/openring.nix { };
  segno = pkgs.callPackage ./pkgs/segno.nix { };
  tic-80 = pkgs.callPackage ./pkgs/tic-80.nix { };
  wikiman = pkgs.callPackage ./pkgs/wikiman { };
}

