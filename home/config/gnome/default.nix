{ pkgs, ... }:

{
  imports = [
    ./dconf.nix
  ];

  qt.platformTheme = "gnome";

  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnomeExtensions.topicons-plus
    gnomeExtensions.blur-my-shell
    gnomeExtensions.window-on-top
    gnomeExtensions.rounded-window-corners-reborn
    gnome-tweaks
    adwaita-qt
    adwaita-icon-theme
    apostrophe
    cartridges
    curtail
    gnome-themes-extra
    video-trimmer
    fragments
    komikku
    foliate
    morphosis
    gnome-terminal
    letterpress
  ];
}
