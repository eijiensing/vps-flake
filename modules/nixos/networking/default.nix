{ ... }: {
  networking = {
    useNetworkd = true;
    firewall = {
      enable = true;

      allowedTCPPorts = [
        22
        80
        443
        22000 # syncthing transfer
        22067 # syncthing relay
      ];
      allowedUDPPorts = [
        22000 # syncthing transfer (quic)
      ];
    };
  };
  systemd.network.enable = true;

  systemd.network.networks."10-wan" = {
    matchConfig.Name = "en*";
    networkConfig.DHCP = "yes";
  };
}
