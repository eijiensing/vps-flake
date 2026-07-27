{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
		./disko.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  networking.hostName = "netcup";

  programs = {
    fish.enable = true;
    command-not-found.enable = false;
  };

  users.users = {
    eiji = {
      shell = pkgs.fish;
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
      ];
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "26.05";
}
