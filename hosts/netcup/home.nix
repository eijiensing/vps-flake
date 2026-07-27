{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../../modules/home-manager
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  home = {
    username = "eiji";
    homeDirectory = "/home/eiji";
  };

  gitName = "eijiensing";
  gitEmail = "eijitron@gmail.com";

  programs = {
    home-manager.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "26.05";
}
