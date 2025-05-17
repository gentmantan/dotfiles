{
  virtualisation.oci-containers.containers = {
    linkstack = {
      image = "ghcr.io/linkstackorg/linkstack";
      autoStart = true;
      ports = [ "127.0.0.1:22976:443" ];
      volumes = [ 
        "/config/linkstack:/htdocs"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      environmentFiles = [ "/config/env/linkstack.env" ];
      pull = "newer";
    };
  };
}
