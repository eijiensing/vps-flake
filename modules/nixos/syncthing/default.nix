{ ... }: {
  services.caddy.virtualHosts."sync.eijiens.ing".extraConfig = ''
    reverse_proxy 127.0.0.1:8384
  '';

  services.syncthing = {
    enable = true;
    user = "eiji";
    group = "users";
    dataDir = "/home/eiji";
    guiAddress = "127.0.0.1:8384";

    # The config below is the single source of truth for devices and folders:
    # anything configured via the web UI that is not declared here gets
    # removed on the next rebuild (run by the syncthing-init service).
    overrideDevices = true;
    overrideFolders = true;

    settings = {
      gui = {
        insecureSkipHostcheck = true;
      };
      options.listenAddresses = [
        "tcp://0.0.0.0:22000"
        "quic://0.0.0.0:22000"
      ];

      devices = {
        desktop = {
          id = "DEEFKC7-GQOVJXE-YVNSLTM-FZGJEBM-RO6KUWL-J55NJ7N-I7KSLAC-EHFAVQJ";
          name = "desktop";
          addresses = [ "dynamic" ];
          compression = "metadata";
        };
        netcup = {
          id = "452E3HA-XGOBFRR-MSBBUNE-3U7IPN5-HYC3KRI-WWQQ5HE-DDJ2VTW-USFPRAQ";
          name = "netcup";
          addresses = [ "dynamic" ];
          compression = "metadata";
        };
        pixel = {
          id = "5GUCB2Q-WGQ5WFW-UPW2R5B-IBA7FLR-RKXUK2S-DPTWRRE-QKV2NRX-EMPM6QA";
          name = "pixel";
          addresses = [ "dynamic" ];
          compression = "metadata";
        };

      };
      folders = {
        default = {
          id = "default";
          label = "Default";
          path = "~/Sync/default";
          type = "sendreceive";
          devices = [
            "desktop"
            "netcup"
            "pixel"
          ];
        };
        food = {
          id = "food";
          label = "Food";
          path = "~/Sync/food";
          type = "sendreceive";
          devices = [
            "desktop"
            "netcup"
            "pixel"
          ];
        };
        italy = {
          id = "italy";
          label = "Italy";
          path = "~/Sync/italy";
          type = "sendreceive";
          devices = [
            "desktop"
            "netcup"
            "pixel"
          ];
        };
        music = {
          id = "music";
          label = "Music";
          path = "~/Sync/music";
          type = "sendreceive";
          devices = [
            "desktop"
            "netcup"
            "pixel"
          ];
        };
      };
    };

    relay = {
      enable = true;
      port = 22067;
      # Empty pool list = private relay; only usable via an explicit relay URL
      # (e.g. relay://sync.eijiens.ing:22067/?id=...). Without this the relay
      # joins the global pool and proxies traffic for anyone.
      pools = [ ];
    };
  };
}
