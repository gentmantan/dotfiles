{
  virtualisation.oci-containers.containers = {
    pyload = {
      image = "lscr.io/linuxserver/pyload-ng";
      autoStart = true;
      ports = [ "127.0.0.1:28895:8000" ];
      volumes = [ 
        "/config/pyload:/config"
        "/nest0/pyload:/downloads"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environment = {
        PUID = "0";
        PGID = "0";
        TZ = "America/New_York";
      };
    };
  };
}
