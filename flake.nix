{
  description = "A basic php setup for local development";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    dolt.url = "github:sbrow/dolt";
    #dolt.follows = "nixpkgs";
  };

  outputs = { self, dolt, flake-utils, nixpkgs }: flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      doltPkg = dolt.packages.${system}.default;
    in
    {
      formatter = pkgs.nixpkgs-fmt;

      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          caddy
          doltPkg
          foreman
          php
          phpPackages.composer
        ];
      };
    });
}
