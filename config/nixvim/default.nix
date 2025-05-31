{ pkgs, ... }:

{

  imports  = [
    ./option.nix
    ./plugin.nix
    ./map.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;

    colorschemes = {
      base16 = {
        enable = true;      
        colorscheme = "material-darker";
        settings = {
          cmp = true;
          illuminate = true;
          indentblankline = true;
          lsp_semantic = true;
          mini_completion = true;
          telescope = true;
          telescope_borders = false;
        };
      };
    };

    extraPackages = with pkgs;[
      jdt-language-server
      ueberzugpp
    ];
  };
}
