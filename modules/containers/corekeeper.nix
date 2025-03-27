{
  virtualisation.oci-containers.containers = {
    corekeeper = {
      image = "docker.io/escaping/core-keeper-dedicated";
      autoStart = true;
      ports = [ "27874:27874/udp" ];
      volumes = [ 
        "/config/games/corekeeper:/home/steam/core-keeper-data"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environmentFiles = [ /config/env/games/corekeeper.env ];
    };
  };
}
