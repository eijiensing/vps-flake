{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.btop
  ];
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

  nix.settings = {
    experimental-features = "nix-command flakes";
  };
}
