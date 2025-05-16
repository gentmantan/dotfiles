{
  virtualisation.oci-containers.containers = {
    papra = {
      image = "ghcr.io/papra-hq/papra:latest-root";
      autoStart = true;
      ports = [ "127.0.0.1:28007:1221" ];
      volumes = [ 
        "/nest0/papra:/app/app-data"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
    };
  };
}
