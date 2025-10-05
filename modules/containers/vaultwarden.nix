{
  virtualisation.oci-containers.containers = {
    vaultwarden = {
      image = "docker.io/vaultwarden/server:latest";
      autoStart = true;
      ports = ["127.0.0.1:27833:80"];
      volumes = [
        "/config/vaultwarden:/data"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environmentFiles = [/config/env/vaultwarden.env];
    };
  };
}
