{
  virtualisation.oci-containers.containers = {
    factorio = {
      image = "docker.io/factoriotools/factorio:stable";
      autoStart = true;
      ports = [ "27876:27876/udp" ];
      volumes = [ 
        "/config/games/factorio:/factorio"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environmentFiles = [ /config/env/games/factorio.env ];
    };
  };
}
