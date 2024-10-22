{ config, pkgs, lib, ... }:

{
  imports = [
  ];

  home.username = "shahruz";
  home.homeDirectory = "/home/shahruz";

  home.packages = with pkgs; [
    neovim
    telegram-desktop
    neofetch
    ripgrep
    htop
    git
    zsh
    starship
    alacritty
    hack-font
    dconf2nix
    jetbrains-toolbox
    jetbrains.idea-community-bin
    zulu17
    upscayl
    gccgo14
    zsh
    nodejs_20
    bun
    yarn
    gnumake
    python312
    ripgrep
    cargo
    postman
    onlyoffice-bin
    ungoogled-chromium
    obs-studio
  ];

  programs.git = {
    enable = true;
    userName = "zawkindev";
    userEmail = "zawkindev@gmail.com";
  };

  programs.starship = {
    enable = true;
  };


  programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";
      window.padding = {
        x = 5;
        y = 3;
      };

      font = {
        normal = {
          family = "Hack";
          style = "Regular";
        };
        bold = {
          family = "Hack";
          style = "Bold";
        };
        italic = {
          family = "Hack";
          style = "Italic";
        };
        bold_italic = {
          family = "Hack";
          style = "Bold Italic";
        };
        size = 14;
      };

      selection.save_to_clipboard = true;
    };
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "autumn_night";
    };

    ignores = [
      ".build/"
      "!.gitignore"
    ];

    languages = {
      language = [{
        name = "nix";
        formatter = { command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt"; };
      }];
    };

    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      clang-tools
      cmake-language-server
      vscode-langservers-extracted
      docker-compose-language-service
      gopls
      delve
      gotools
      golangci-lint-langserver
      jdt-language-server
      typescript
      nodePackages.typescript-language-server
      kotlin-language-server
      lua-language-server
      marksman
      nil
      nixpkgs-fmt
      python312Packages.python-lsp-server
      rust-analyzer
      tailwindcss-language-server
      taplo
      lemminx
      yaml-language-server
      ansible-language-server
      libsForQt5.qt5ct
      libsForQt5.qtstyleplugin-kvantum
    ];
  };


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

    "~/.zshrc".text = ''
        echo "Creating .zshrc file..."
      eval "$(starship init zsh)"
    '';

  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  home.stateVersion = "24.05";
}
