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
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";


  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "ctrl:swapcaps";

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    desktopManager.plasma6.enable = true;
  };

  programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";

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

  # Install firefox.
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnomeExtensions.topicons-plus
    gnomeExtensions.blur-my-shell
    gnome.gnome-tweaks
    auto-cpufreq
    powertop
    evdevremapkeys
    vim
    telegram-desktop
    neovim
    fastfetch
    git
    wget
    curl
    vscodium
    xclip
    nixpkgs-fmt
    nil
    qbittorrent
    pgadmin4-desktopmode
    cmake
  ];

  services.auto-cpufreq.enable = true;
  services.udev.packages = [ pkgs.gnome.gnome-settings-daemon ];
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

  services.pgadmin = {
    enable = true;
    initialEmail = "zawkindev@gmail.com";
    initialPasswordFile = "/var/lib/pgadmin/initial-password"; # Define this file
    # port = 5432;
  };

  systemd.services.powertop = {
    description = "powertop";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.powertop}/bin/powertop --auto-tune";
    };
  };


  system.stateVersion = "24.05"; # Did you read the comment?
}
