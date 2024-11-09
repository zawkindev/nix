{ config, pkgs, ... }:

{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "history-substring-search" "colored-man-pages" "z" ];
    };

    shellAliases = {
      ll = "ls -l";
      cls = "clear";
      tx = "tmux";
      g = "git";
      gc = "git clone";
      ga = "git add .";
      gs = "git status";
      gcm = "git commit -m";
      gpsh = "git push";
      gpl = "git pull";
    };
  };

  programs.starship = {
    enable = true;
  };
  
  home.file = {
    "~/.zshrc".text = ''
        echo "Creating .zshrc file..."
      eval "$(starship init zsh)"
    '';
  };
}
