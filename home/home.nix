{ pkgs, ... }:

let
  configModules = import ./config;
in
{
  imports = [
    configModules.zsh
    # configModules.helix
    configModules.gnome
    configModules.git
    configModules.ideavim
    # configModules.plasma
    # configModules.vscode # vscode-ni lsp ko'rmayapti
  ];

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    poppler
    imagemagick
    inkscape-with-extensions
    vlc
    scrcpy
    flameshot
    anydesk
    neofetch
    ripgrep
    git
    zsh
    starship
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
    nerd-fonts.fira-code
    cbonsai
    libsForQt5.qtcurve
    go
  ];

  home.keyboard.options = [ "ctrl:swapcaps" ];

  home.file.".xprofile" = {
    source = pkgs.writeText "xprofile" ''
      setxkbmap -option ctrl:swapcaps
    '';
  };
}
