{pkgs, lib, config, ...}: {
  imports = [
    # ./nvidia.nix
    ./configuration.nix
    ./hardware-configuration.nix
  ];
}
