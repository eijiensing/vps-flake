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
        25565
      ];
      allowedUDPPorts = [
        22000 # syncthing transfer (quic)
        25565
      ];
    };
  };
  systemd.network.enable = true;

  systemd.network.networks."10-wan" = {
    matchConfig.Name = "en*";
    networkConfig.DHCP = "yes";
  };
}
