{ pkgs, ... }:

{

  imports = [
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

    extraConfigLuaPost = ''
      -- Make background transparent
      vim.cmd [[
        highlight Normal guibg=NONE ctermbg=NONE
        highlight NormalNC guibg=NONE ctermbg=NONE
        highlight Pmenu guibg=NONE ctermbg=NONE
        highlight SignColumn guibg=NONE ctermbg=NONE
        highlight VertSplit guibg=NONE ctermbg=NONE
        highlight StatusLine guibg=NONE ctermbg=NONE
        highlight LineNr guibg=NONE ctermbg=NONE
        highlight CursorLineNr guibg=NONE ctermbg=NONE
        highlight FoldColumn guibg=NONE ctermbg=NONE
        highlight WinSeparator guibg=NONE ctermbg=NONE
      ]]  
    '';


    extraPackages = with pkgs;[
      jdt-language-server
      ueberzugpp
    ];
  };
}
