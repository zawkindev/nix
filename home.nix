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
    import ./nixvim
  ];

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    ripgrep
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
    git
    wget
    curl
    xclip
    nixpkgs-fmt
    cmake
    fira-code-nerdfont
  ];
}
