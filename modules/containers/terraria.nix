{
  virtualisation.oci-containers.containers = {
    terraria-1 = {
      image = "docker.io/ryshe/terraria";
      autoStart = true;
      ports = [ "27875:27875" ];
      volumes = [ 
        "/config/games/terraria/world:/root/.local/share/Terraria/Worlds"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environmentFiles = [ /config/env/games/terraria-1.env ];
    };
    terraria-2 = {
      image = "docker.io/ryshe/terraria";
      autoStart = true;
      ports = [ "27878:27878" ];
      volumes = [ 
        "/config/games/terraria2/world:/root/.local/share/Terraria/Worlds"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environmentFiles = [ /config/env/games/terraria-2.env ];
    };
    terraria-3 = {
      image = "docker.io/jacobsmile/tmodloader1.4";
      autoStart = true;
      ports = [ "27879:27879" ];
      volumes = [ 
        "/config/games/terraria3:/data"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environmentFiles = [ /config/env/games/terraria-3.env ];
    };
  };
}
