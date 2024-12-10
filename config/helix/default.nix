{ config, pkgs, ... }:

{
programs.helix = {
    enable = true;

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
    ];
};


}
