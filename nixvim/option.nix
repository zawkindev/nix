{ ... }:

{
  programs.nixvim = {
    opts = {
      guicursor = "";
      # Line numbers
      relativenumber = true; # Relative line numbers
      number = true; # Display the absolute line number of the current line

      swapfile = false; # Disable the swap file
      incsearch = true; # Incremental search: show match for partly typed search command
      ignorecase = true; # When the search query is lower-case, match both lower and upper-case
      #   patterns
      smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper
      #   case characters
      scrolloff = 8; # Number of screen lines to show around the cursor
      cursorline = false; # Highlight the screen line of the cursor
      cursorcolumn = false; # Highlight the screen column of the cursor
      signcolumn = "yes"; # Whether to show the signcolumn
      termguicolors = true; # Enables 24-bit RGB color in the |TUI|

      # Tab options
      tabstop = 2; # Number of spaces a <Tab> in the text stands for (local to buffer)
      shiftwidth = 2; # Number of spaces used for each step of (auto)indent (local to buffer)
      expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)
      smartindent = true; # Do clever autoindenting
      wrap = false;
    };
  };
}
