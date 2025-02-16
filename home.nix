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
    configModules.vscode # vscode-ni lsp ko'rmayapti
    # import ./nixvim
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
    haskell.compiler.native-bignum.ghcHEAD
    fira-code-nerdfont
    rose-pine-cursor
    numix-cursor-theme
    posy-cursors
    mint-cursor-themes
    cbonsai
  ];

  home.file.".xprofile" = {
    source = pkgs.writeText "xprofile" ''
      setxkbmap -option ctrl:swapcaps
    '';
  };
}
