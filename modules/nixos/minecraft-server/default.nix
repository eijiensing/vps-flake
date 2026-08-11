{ pkgs, ... }: {
  services.minecraft-servers = {
    enable = true;
    eula = true;

    servers.vanilla = {
      enable = true;
      package = pkgs.fabricServers.fabric-1_21_11;

      jvmOpts = "-Xms1G -Xmx2G";

      serverProperties = {
        server-port = 25565;
        difficulty = 3;
        gamemode = 0;
      };
    };
  };
}
