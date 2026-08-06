{ ... }: {
  services.caddy.virtualHosts."sync.eijiens.ing".extraConfig = ''
    reverse_proxy 127.0.0.1:8384
  '';

  services.syncthing = {
    enable = true;
    guiAddress = "127.0.0.1:8384";
  };
}
