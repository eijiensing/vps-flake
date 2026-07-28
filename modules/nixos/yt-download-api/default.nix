{ inputs, ... }: {
  services.caddy.virtualHosts."yt.eijiens.ing".extraConfig = ''
    reverse_proxy 127.0.0.1:3000
  '';

  systemd.services.yt-download-api = {
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      ExecStart = "${inputs.yt-download-api.packages.x86_64-linux.default}/bin/yt-download-api";

      Environment = [
        "YT_OUTPUT_PATH=/home/eiji/Sync/music/"
        "YT_API_KEY=test123"
      ];

      Restart = "always";
    };
  };
}
