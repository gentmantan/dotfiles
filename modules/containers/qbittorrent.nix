{
  virtualisation.oci-containers.containers = {
    qbittorrent = {
      image = "ghcr.io/qbittorrent/docker-qbittorrent-nox";
      autoStart = true;
      volumes = [ 
        "/config/qbittorrent:/config"
        "/nest0/torrents:/downloads"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environment = {
        QBT_LEGAL_NOTICE="confirm";
        QBT_WEBUI_PORT = "16190";
        PUID = "0";
        PGID = "0";
      };
      extraOptions = [ "--network=host" ];
    };
  };
}
