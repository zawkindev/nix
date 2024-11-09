{config, pkgs, ...}:

{
  imports  = [
    ./dconf.nix
  ];

  programs.gnomeExtensions.enable = true;  

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome.gnome-shell-extensions
    gnomeExtensions.user-themes
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnomeExtensions.topicons-plus
    gnomeExtensions.blur-my-shell
  ];
}
