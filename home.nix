{ pkgs, nixvim, ... }:

let
  configModules = import ./config;
in
{
  imports = [

    nixvim.homeManagerModules.nixvim
    configModules.zsh
    configModules.helix
    configModules.gnome
    configModules.git
    configModules.ideavim
  ];

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    neovim
    neofetch
    ripgrep
    htop
    git
    zsh
    starship
    hack-font
    dconf2nix
    gccgo14
    zsh
    nodejs_20
    bun
    yarn
    gnumake
    python312
    ripgrep
    cargo
    vim
    neovim
    git
    wget
    curl
    xclip
    nixpkgs-fmt
    cmake
    maven
    openjdk17
  ];

  programs.nixvim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      luaLoader.enable = true;
  };
}
