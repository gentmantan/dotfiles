{
  virtualisation.oci-containers.containers = {
    fireshare = {
      image = "docker.io/shaneisrael/fireshare";
      autoStart = true;
      ports = [ "127.0.0.1:13450:80" ];
      volumes = [ 
        "/nest0/fireshare/data:/data"
        "/nest0/fireshare/processed:/processed"
        "/nest0/fireshare/videos:/videos"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environmentFiles = [ /config/env/fireshare.env ];
    };
  };
}
