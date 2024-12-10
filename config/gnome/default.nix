{ pkgs, ...}:

{
  imports  = [
    ./dconf.nix
  ];

  home.packages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.user-themes
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnomeExtensions.topicons-plus
    gnomeExtensions.blur-my-shell
  ];
}
