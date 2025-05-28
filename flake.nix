{
  description = "Unified Flake for NixOS and Arch Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
  };

  outputs = { self, nixpkgs, home-manager, alacritty-theme, nixvim, hyprland, plasma-manager, apple-fonts, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      appleFonts = apple-fonts.packages.${system};
    in
    {
      # Configuration for NixOS
      nixosConfigurations.tya = nixpkgs.lib.nixosSystem rec {
        inherit system;
        specialArgs = { inherit hyprland; };
        modules = [
          nixvim.nixosModules.nixvim
          hyprland.nixosModules.default
          home-manager.nixosModules.home-manager
          ./nixvim
          ./configuration.nix
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.shahruz = import ./home.nix;
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
            environment.systemPackages = [
              appleFonts."sf-pro"
              appleFonts."sf-mono-nerd"
            ];
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

          ./nixvim

          ./home.nix
        ];
      };
    };
}

