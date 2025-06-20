# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  # Bootloader.
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    useOSProber = true;
    device = "nodev"; # Required for EFI systems
    extraConfig = ''
      GRUB_DISABLE_OS_PROBER=false
    '';
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelParams = [ "usbcore.autosuspend=-1" ];

  networking.hostName = "tya"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  networking.resolvconf.enable = false;
  environment.etc."resolv.conf".text = ''
    nameserver 1.1.1.1
    nameserver 8.8.8.8
  '';


  time.timeZone = "Asia/Tashkent";

  i18n = {
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];
    defaultLocale = "en_US.UTF-8";
  };


  services.printing.enable = true;

  services.xserver = {
    enable = true;
    xkb.layout = "us,ru";
    xkb.options = "ctrl:swapcaps,grp:alt_shift_toggle";

    displayManager.gdm.enable = true;
    desktopManager = {
      gnome.enable = true;
    };
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
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
      fuse3
      unityhub
    ];
  };

  # users.users.yourUserName.extraGroups = [ "fuse" ];

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs;  [
    powertop
    telegram-desktop
    vscodium
    qbittorrent
    upscayl
    onlyoffice-bin
    obs-studio
    postman
    telegram-desktop
    openjdk17
    gimp
    ntfs3g
    udisks2
    gnome.gvfs
    os-prober
  ];

  services.udisks2.enable = true;

  services.udev.packages = [ pkgs.gnome-settings-daemon ];
  users.defaultUserShell = pkgs.zsh;

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_14;
    ensureDatabases = [ "gardening" ];
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      local all      all                    trust
      host  all      all     127.0.0.1/32   trust
      host  all      all     ::1/128        trust
    '';
    initialScript = pkgs.writeText "gardening-initScript" ''
      CREATE ROLE gardening_user WITH LOGIN PASSWORD 'G&(69qaklsjdb' CREATEDB;
      GRANT ALL PRIVILEGES ON DATABASE gardening TO gardening_user;
    '';
  };

  systemd.services.powertop = {
    description = "powertop";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.powertop}/bin/powertop --auto-tune";
    };
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
