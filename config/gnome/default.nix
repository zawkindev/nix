{ pkgs, ... }:

{
  imports = [
    ./dconf.nix
  ];

  home.packages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.user-themes
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnomeExtensions.topicons-plus
    gnomeExtensions.blur-my-shell
    gnomeExtensions.window-on-top
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
  ];
}
