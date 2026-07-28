{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.btop
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings = {
    experimental-features = "nix-command flakes";
  };
}
