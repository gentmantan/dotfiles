{
  virtualisation.oci-containers.containers = {
    zomboid-1 = {
      image = "ghcr.io/renegade-master/zomboid-dedicated-server";
      autoStart = true;
      ports = [ "27880:27880" "27881:27881" ];
      volumes = [ 
        "/config/games/zomboid1/server:/home/steam/ZomboidDedicatedServer"
        "/config/games/zomboid1/config:/home/steam/Zomboid"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environment = {
        QUERY_PORT = "27880";
        GAME_PORT = "27881";
      };
      environmentFiles = [ /config/env/games/zomboid.env ];
    };
    zomboid-2 = {
      image = "ghcr.io/renegade-master/zomboid-dedicated-server";
      autoStart = true;
      ports = [ "27882:27882" "27883:27883" ];
      volumes = [ 
        "/config/games/zomboid2/server:/home/steam/ZomboidDedicatedServer"
        "/config/games/zomboid2/config:/home/steam/Zomboid"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environment = {
        QUERY_PORT = "27882";
        GAME_PORT = "27883";
      };
      environmentFiles = [ /config/env/games/zomboid.env ];
    };
  };
}
