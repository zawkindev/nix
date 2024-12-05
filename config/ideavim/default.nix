{ pkgs, ... }:

{
  # Create the .ideavimrc file in the user's home directory
  home.file.".ideavimrc" = {
    source = pkgs.writeText "ideavimrc" ''
      :map fmt <Action>(ReformatCode)
      :map mn <Action>(NextTab)
      :map ml <Action>(PreviousTab)
      :map ;r <Action>(FindInPath)
      :map ;f <Action>(GotoFile)
      :map nf <Action>(NewScratchFile)
      :map np <Action>(WelcomeScreen.CreateDirectoryProject)
      :map sv <Action>(SplitVertically)
      :map ss <Action>(SplitHorizontally)
      :map sc <Action>(Unsplit)
      
      :map <C-t> <Action>(ActivateProjectToolWindow)
      :map <C-=> <Action>(ZoomInIdeAction)
      :map <C--> <Action>(ZoomOutIdeAction)
    '';
  };
}
