{ ... }:

{

programs.nixvim.plugins = {  bufferline = {
    enable = true;
  };

  lualine = {
      enable = true;
  };

   # Includes all parsers for treesitter
  treesitter = {
    enable = true;
  };

  # Icons 
  web-devicons.enable = true;

  # Auto-tagging
  ts-autotag = {
    enable = true;
  };

  # Autopairs
  nvim-autopairs = {
    enable = true;
  };

  # Lazygit
  lazygit = {
    enable = true;
  };

  # Easily toggle comments
  commentary.enable = true;

  # Git signs in code
  gitsigns = {
    enable = true;
    settings.current_line_blame = true;
  };

  # Markdown preview server
  markdown-preview = {
    enable = true;
    settings.theme = "dark";
  };

    render-markdown = {
      enable = true;
      settings = {
        enabled = true; # This lets you set whether the plugin should render documents from the start or not. Useful if you want to use a command like RenderMarkdown enable to start rendering documents rather than having it on by default.
        bullet = {
          icons = [
            "•"
          ];
          right_pad = 1;
        };
        code = {
          above = " ";
          below = " ";
          border = "thick";
          language_pad = 2;
          left_pad = 2;
          position = "right";
          right_pad = 2;
          sign = false;
          width = "block";
        };
        heading = {
          border = true;
          icons = [
            "1 "
            "2 "
            "3 "
            "4 "
            "5 "
            "6 "
          ];
          position = "inline";
          sign = false;
          width = "full";
        };
        render_modes = true;
        signs = {
          enabled = false;
        };
      };
    };

    image = {
      enable = true;
      backend = "kitty";
      hijackFilePatterns = [
        "*.png"
        "*.jpg"
        "*.jpeg"
        "*.gif"
        "*.webp"
      ];
      maxHeightWindowPercentage = 25;
      tmuxShowOnlyInActiveWindow = true;
      integrations = {
        markdown = {
          enabled = true;
          downloadRemoteImages = true;
          filetypes = [
            "markdown"
            "vimwiki"
            "mdx"
          ];
        };
      };
    };

    # Good old Telescope
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
    };

    # Todo comments
    todo-comments = {
      enable = true;
      settings.colors = {
        error = ["DiagnosticError" "ErrorMsg" "#DC2626"];
        warning = ["DiagnosticWarn" "WarningMsg" "#FBBF24"];
        info = ["DiagnosticInfo" "#2563EB"];
        hint = ["DiagnosticHint" "#10B981"];
        default = ["Identifier" "#7C3AED"];
        test = ["Identifier" "#FF00FF"];
      };
    };

    # File tree
    neo-tree = {
      enable = true;
      enableDiagnostics = true;
      enableGitStatus = true;
      enableModifiedMarkers = true;
      enableRefreshOnWrite = true;
      closeIfLastWindow = true;
      popupBorderStyle = "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
      buffers = {
        bindToCwd = false;
        followCurrentFile = {
          enabled = true;
        };
      };
      window = {
        width = 40;
        height = 15;
        autoExpandWidth = false;
        mappings = {
          "<space>" = "none";
          s = "none";
        };
      };
    };

     # Nix expressions in Neovim
    nix = {
      enable = true;
    };

 # Language server
    lsp = {
      enable = true;
      servers = {
        # Average webdev LSPs
        # ts-ls.enable = true; # TS/JS
        ts_ls.enable = true; # TS/JS
        cssls.enable = true; # CSS
        tailwindcss.enable = true; # TailwindCSS
        html.enable = true; # HTML
        astro.enable = true; # AstroJS
        phpactor.enable = true; # PHP
        svelte.enable = false; # Svelte
        vuels.enable = false; # Vue
        pyright.enable = true; # Python
        marksman.enable = true; # Markdown
        nil_ls.enable = true; # Nix
        dockerls.enable = true; # Docker
        bashls.enable = true; # Bash
        clangd.enable = true; # C/C++
        csharp_ls.enable = true; # C#
        yamlls.enable = true; # YAML
        gopls = { # Golang
          enable = true;
          autostart = true;
        };

        lua_ls = { # Lua
          enable = true;
          settings.telemetry.enable = false;
        };

        # Rust
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
      };
    };

    cmp = {
      enable = true;
      settings = {
        completion = {
          completeopt = "menu,menuone,noinsert";
        };
        autoEnableSources = true;
        experimental = { ghost_text = true; };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        formatting = { fields = [ "kind" "abbr" "menu" ]; };
        sources = [
          { name = "nvim_lsp"; }
          { name = "emoji"; }
          {
            name = "buffer"; # text within current buffer
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          # { name = "copilot"; } # enable/disable copilot
          {
            name = "path"; # file system paths
            keywordLength = 3;
          }
          {
            name = "luasnip"; # snippets
            keywordLength = 3;
          }
        ];

        window = {
          completion = { border = "solid"; };
          documentation = { border = "solid"; };
        };

        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };

    cmp-emoji = {
      enable = true;
    };

    cmp-nvim-lsp = {
      enable = true; # LSP
    };
    cmp-buffer = {
      enable = true;
    };
    cmp-path = {
      enable = true; # file system paths
    };
    cmp_luasnip = {
      enable = true; # snippets
    };
    cmp-cmdline = {
      enable = true; # autocomplete for cmdline
    }; 
  };
}
