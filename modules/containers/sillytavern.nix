{
  virtualisation.oci-containers.containers = {
    sillytavern = {
      image = "ghcr.io/sillytavern/sillytavern";
      autoStart = true;
      ports = [ "127.0.0.1:30799:8000" ];
      volumes = [ 
        "/config/sillytavern/config:/home/node/app/config"
        "/config/sillytavern/plugins:/home/node/app/plugins"
        "/config/sillytavern/data:/home/node/app/data"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environment = {
        TZ = "America/New_York";
      };
    };
  };
}
