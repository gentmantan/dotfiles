{
  virtualisation.oci-containers.containers = {
    palworld = {
      image = "ghcr.io/thijsvanloef/palworld-server-docker";
      autoStart = true;
      ports = [ "27873:27873/udp" ];
      volumes = [ 
        "/config/games/palworld:/palworld"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environmentFiles = [ /config/env/games/palworld.env ];
    };
  };
}
