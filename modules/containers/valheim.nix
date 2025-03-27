{
  virtualisation.oci-containers.containers = {
    valheim = {
      image = "ghcr.io/lloesche/valheim-server";
      autoStart = true;
      ports = [ "27877:27877" ];
      volumes = [ 
        "/config/games/valheim/config:/config"
        "/config/games/valheim/data:/opt/valheim"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environmentFiles = [ /config/env/games/valheim.env ];
    };
  };
}
