{ config, pkgs, lib, ... }:

let
  configModules = import ./config;
in
{
  imports = [
    configModules.zsh
    configModules.helix
  ];

  home.stateVersion = "24.05";

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
  ];

  home.file = {
    "~/.ideavimrc".text = ''
        echo "Creating .ideavimrc file..."
      :map fmt <Action>(ReformatCode)
      :map mn <Action>(NextTab)
      :map ml <Action>(PreviousTab)
      :map ;r <Action>(FindInPath)
      :map ;f <Action>(GotoFile)
      :map nf <Action>(NewScratchFile)
      :map np <Action>(WelcomeScreen.CreateDirectoryProject)
      :map op <Action>($LRU)
      :map sv <Action>(SplitVertically)
      :map ss <Action>(SplitHorizontally)
      :map sc <Action>(Unsplit)
      
      :map <C-t> <Action>(ActivateProjectToolWindow)
      :map <C-=> <Action>(ZoomInIdeAction)
      :map <C--> <Action>(ZoomOutIdeAction)
    '';
  };
}
