{ ... }: {
  networking = {
    useNetworkd = true;
    firewall = {
      enable = true;

      allowedTCPPorts = [
        22
        80
        443
      ];
    };
  };
  systemd.network.enable = true;

  systemd.network.networks."10-wan" = {
    matchConfig.Name = "en*";
    networkConfig.DHCP = "yes";
  };
}
