{ pkgs, ... }:

let
  configModules = import ./config;
in
{
  imports = [
    configModules.zsh
    configModules.helix
    configModules.gnome
    configModules.git
    configModules.ideavim
    # import ./nixvim
  ];

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
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
    git
    wget
    curl
    xclip
    nixpkgs-fmt
    cmake
    maven
    openjdk17
    fira-code-nerdfont
  ];
}
