{ pkgs, ... }: {
  services.minecraft-servers = {
    enable = true;
    eula = true;

    dataDir = "/srv/minecraft";
    user = "eiji";
    group = "users";

    servers.vanilla = {
      enable = true;
      package = pkgs.fabricServers.fabric-26_3;

      jvmOpts = "-Xmx2G";

      serverProperties = {
        server-port = 25565;
      };
    };
  };

  systemd.tmpfiles.rules = [
    "d /srv/minecraft 0755 eiji users -"
  ];
}
