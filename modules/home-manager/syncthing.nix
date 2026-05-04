{
  services.podman = {
    enable = true;
    containers.syncthing = {
      autoStart = true;
      autoUpdate = "registry";
      environment = {
        PUID = "0";
        PGID = "0";
      };
      image = "ghcr.io/syncthing/syncthing:latest";
      ports = ["127.0.0.1:8384:8384"];
      volumes = ["/home/tangy/.keepass:/keepass" "/home/tangy/Documents:/Documents" "syncthing:/var/syncthing"];
    };
  };
}
