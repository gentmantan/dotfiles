{
  virtualisation.oci-containers.containers = {
    syncthing = {
      image = "ghcr.io/syncthing/syncthing:latest";
      autoStart = true;
      ports = [ "127.0.0.1:31817:8384" "22000:22000" "22000:22000/udp" ];
      volumes = [ 
        "/nest0/syncthing:/var/syncthing"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environment = {
        PUID="0";
        PGID="0";
      };
    };
  };
}
