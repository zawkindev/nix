{
  description = "Unified Flake for NixOS and Arch Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Configuration for NixOS
      nixosConfigurations.tya = nixpkgs.lib.nixosSystem rec {
        inherit system;
        modules = [
          nixvim.nixosModules.nixvim
          home-manager.nixosModules.home-manager
          ./config
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.shahruz = import ./home/home.nix;
            # home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
          }

          # Enable allowUnfree for NixOS
          ({ config, pkgs, ... }: {
            nixpkgs.config.allowUnfree = true;
          })


          # Custom module for symlinks
          ({ config, pkgs, lib, ... }: {
            system.activationScripts.nixvimSymlinks.text = ''
              mkdir -p /usr/local/bin
              ln -sf ${pkgs.neovim}/bin/nvim /usr/local/bin/vim
              ln -sf ${pkgs.neovim}/bin/nvim /usr/local/bin/vi
            '';
          })
        ];
      };

      # Configuration for non-NixOS (e.g., Arch Linux)
      homeConfigurations.shahruz = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ({ config, pkgs, ... }: {
            home.username = "shahruz";
            home.homeDirectory = "/home/shahruz";
          })

          nixvim.homeManagerModules.nixvim

          ./config/nixvim

          ./home/home.nix
        ];
      };
    };
}

