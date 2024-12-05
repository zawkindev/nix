# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "usbcore.autosuspend=-1" ];

  networking.hostName = "asuna"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tashkent";

  i18n.defaultLocale = "en_US.UTF-8";


  services.printing.enable = true;

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.options = "ctrl:swapcaps";

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shahruz = {
    isNormalUser = true;
    description = "Shahruz Norimmatov";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  programs.firefox.enable = true;
  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs;  [
    powertop
    telegram-desktop
    vscodium
    qbittorrent
    pgadmin4-desktopmode
    iosevka
    jetbrains-toolbox
    jetbrains.idea-community-bin
    upscayl
    onlyoffice-bin
    obs-studio
    postman
    telegram-desktop
  ];

  services.udev.packages = [ pkgs.gnome-settings-daemon ];
  users.defaultUserShell = pkgs.zsh;

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    ensureDatabases = [ "b1_db" ];
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      local all      all                    trust
      host  all      all     127.0.0.1/32   trust
      host  all      all     ::1/128        trust
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE nixcloud WITH LOGIN PASSWORD 'nixcloud' CREATEDB;
      CREATE DATABASE nixcloud;
      GRANT ALL PRIVILEGES ON DATABASE nixcloud TO nixcloud;
    '';
  };

  systemd.services.powertop = {
    description = "powertop";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.powertop}/bin/powertop --auto-tune";
    };
  };

  system.stateVersion = "24.11"; # Did you read the comment?
}
