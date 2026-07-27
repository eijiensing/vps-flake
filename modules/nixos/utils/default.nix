{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.btop
  ];
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  boot.loader.grub.enable = true;

  nix.settings = {
    experimental-features = "nix-command flakes";
  };
}
