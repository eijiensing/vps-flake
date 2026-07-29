{ ... }: {
  services.caddy.virtualHosts."eijiens.ing, www.eijiens.ing".extraConfig = ''
    root * /srv/portfolio
    encode gzip
    file_server

    try_files {path} /index.html
  '';
}
