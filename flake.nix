# flake.nix

{
  description = "Unified Flake for NixOS and Arch Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
  };

  outputs = { self, nixpkgs, home-manager, alacritty-theme, ... }@inputs: {
    # Configuration for NixOS
    nixosConfigurations.asuna = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.shahruz = import ./home.nix;
        }
      ];
    };

    # Configuration for non-NixOS (e.g., Arch Linux)
    homeConfigurations.shahruz = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      modules = [
       ({ config, pkgs, ... }: {
          home.username = "shahruz";
          home.homeDirectory = "/home/shahruz";
        })

        ./home.nix
      ];
    };
  };
}


