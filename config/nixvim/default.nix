{ ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;

    colorschemes = {
      base16.enable = true;
      base16.colorscheme = "material-darker";
    };
      
    plugins = {
      lualine.enable = true;
    };
  };
}
