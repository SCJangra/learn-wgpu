{
  description = "Learn WGPU";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, fenix, flake-utils, ... }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
      fenixLib = fenix.packages.${system};
      rustToolchain = fenixLib.stable.toolchain;
    in
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [ rustToolchain nil ];
      };
    });
}
