{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs; [
      vscode-extensions.haskell.haskell
      vscode-extensions.asvetliakov.vscode-neovim
      vscode-extensions.equinusocio.vsc-material-theme
      vscode-extensions.equinusocio.vsc-material-theme-icons
    ];
    keybindings = [
      {
        key = "ctrl+b";
        command = "-vscode-neovim.ctrl-b";
        when = "editorTextFocus && neovim.ctrlKeysNormal.b && neovim.init && neovim.mode != 'insert' && editorLangId not in 'neovim.editorLangIdExclusions'";
      }
      {
        key = "alt+h";
        command = "workbench.view.explorer";
        when = "viewContainer.workbench.view.explorer.enabled";
      }
      {
        key = "alt+h";
        command = "-testing.toggleTestingPeekHistory";
        when = "testing.isPeekVisible";
      }
      {
        key = "alt+l";
        command = "workbench.action.focusFirstEditorGroup";
      }
      {
        key = "shift+alt+l";
        command = "toggleSearchEditorContextLines";
        when = "inSearchEditor";
      }
      {
        key = "alt+l";
        command = "-toggleSearchEditorContextLines";
        when = "inSearchEditor";
      }
      {
        key = "ctrl+k";
        command = "-vscode-neovim.send";
        when = "editorTextFocus && neovim.ctrlKeysNormal.k && neovim.init && neovim.mode != 'insert' && editorLangId not in 'neovim.editorLangIdExclusions'";
      }
      {
        key = "ctrl+k";
        command = "-vscode-neovim.send";
        when = "editorTextFocus && neovim.ctrlKeysInsert.k && neovim.init && neovim.mode == 'insert' && editorLangId not in 'neovim.editorLangIdExclusions'";
      }
      {
        key = "ctrl+c";
        command = "-vscode-neovim.escape";
        when = "editorTextFocus && neovim.ctrlKeysInsert.c && neovim.init && neovim.mode != 'normal' && editorLangId not in 'neovim.editorLangIdExclusions'";
      }
      {
        key = "ctrl+c";
        command = "-vscode-neovim.escape";
        when = "editorTextFocus && neovim.ctrlKeysNormal.c && neovim.init && !dirtyDiffVisible && !findWidgetVisible && !inReferenceSearchEditor && !markersNavigationVisible && !notebookCellFocused && !notificationCenterVisible && !parameterHintsVisible && !referenceSearchVisible && neovim.mode == 'normal' && editorLangId not in 'neovim.editorLangIdExclusions'";
      }
    ];
  };

}
