{
  virtualisation.oci-containers.containers = {
    komga = {
      image = "ghcr.io/gotson/komga";
      autoStart = true;
      ports = [ "127.0.0.1:17524:25600" ];
      volumes = [ 
        "/config/komga:/config"
        "/nest0/komga:/data"
      ];
      pull = "newer";
      environmentFiles = [
        /config/env/komga.env
      ];
    };
  };
}
