{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  inherit (lib) optional optionals;

  # Look at search.nixos.org for the newest packages
  elixir = beam.packages.erlangR26.elixir_1_15;
  nodejs = nodejs_20;
in

mkShell {
  buildInputs = [ elixir nodejs git ]
    ++ optionals stdenv.isLinux [ inotify-tools libnotify ] # For file_system on Linux.
    ++ optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
      # For file_system on macOS.
      CoreFoundation
      CoreServices
    ]);
}