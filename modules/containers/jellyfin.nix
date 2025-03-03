{
  virtualisation.oci-containers.containers = {
    jellyfin = {
      image = "ghcr.io/jellyfin/jellyfin:latest";
      autoStart = true;
      ports = [ "127.0.0.1:34061:8096" ];
      volumes = [ 
        "/config/jellyfin/config:/config"
        "/config/jellyfin/cache:/cache"
        "/nest0/jellyfin:/media:ro"
      ];
      pull = "newer";
      extraOptions = [ 
        "--device=/dev/dri/renderD128:/dev/dri/renderD128:rwm"
      ];
    };
  };
}
