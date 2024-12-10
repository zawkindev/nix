{ ... }:
{
programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
  keymaps = [
    # Neo-tree bindings
    {
      action = "<cmd>Neotree toggle<CR>";
      key = "<C-n>";
    }

    # Lazygit
    {
      mode = "n";
      key = "<leader>g";
      action = "<cmd>LazyGit<CR>";
      options = {
        desc = "LazyGit (root dir)";
      };
    }

    # Commentary bindings
    {
      action = "<cmd>Commentary<CR>";
      key = "<C-c>";
    }

    # Telescope bindings
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = ";r";
    }
    {
      action = "<cmd>Telescope find_files<CR>";
      key = ";f";
    }
    {
      action = "<cmd>Telescope git_commits<CR>";
      key = ";g";
    }
    {
      action = "<cmd>Telescope oldfiles<CR>";
      key = ";h";
    }
    {
      action = "<cmd>Telescope colorscheme<CR>";
      key = ";ch";
    }
    {
      action = "<cmd>Telescope man_pages<CR>";
      key = ";d";
    }

    
    # Bufferline bindings
    {
      mode = "n";
      key = "mn";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "ml";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }
    {
      mode = "n";
      key = "mk";
      action = "<cmd>bdelete<cr>";
      options = {
        desc = "Delete buffer";
      };
    }
    {
      mode = "n";
      key = "mc";
      action = "<cmd>tabedit<cr>";
      options = {
        desc = "Create empty buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>y";
      action = "\"+y";
    }
    {
      mode = "v";
      key = "<leader>y";
      action = "\"+y";
    }
    {
      mode = "v";
      key = "<leader>Y";
      action = "\"+Y";
    }
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
    }
    {
      mode = "x";
      key = "<leader>p";
      action = "\"_dP";
    }
    {
      mode = "n";
      key = "ss";
      action = ":split<Return>";
      options = {
        noremap = true;
        silent = true;
      };
     }
     {
       mode = "n";
       key = "sv";
       action = ":vsplit<Return>";
       options = {
         noremap = true;
         silent = true;
       };
     }
     {
       mode = "n";
       key = "sh";
       action = "<C-w>h";
     }
     {
       mode = "n";
       key = "sk";
       action = "<C-w>k";
     }
     {
       mode = "n";
       key = "sj";
       action = "<C-w>j";
     }
     {
       mode = "n";
       key = "sl";
       action = "<C-w>l";
     }
  ];
};
}
