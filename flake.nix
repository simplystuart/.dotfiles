{
  description = "🏡 Home Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    arch = "aarch64-darwin";
    username = "stuartdum";
  in {
    defaultPackage.${arch} = home-manager.defaultPackage.${arch};

    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${arch};
      modules = [ ./home.nix ];
    };
  };
}
