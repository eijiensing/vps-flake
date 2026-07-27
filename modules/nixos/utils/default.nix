{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.btop
  ];

  networking.useNetworkd = true;
  systemd.network.enable = true;

  systemd.network.networks."10-wan" = {
    matchConfig.Name = "en*";
    networkConfig.DHCP = "yes";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings = {
    experimental-features = "nix-command flakes";
  };
}
