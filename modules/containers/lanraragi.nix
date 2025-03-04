{
  virtualisation.oci-containers.containers = {
    lanraragi = {
      image = "docker.io/difegue/lanraragi:latest";
      autoStart = true;
      ports = [ "127.0.0.1:16543:3000" ];
      volumes = [ 
        "/nest0/lanraragih/manga:/home/koyomi/lanraragi/content:ro"
        "/nest0/lanraragih/thumb:/home/koyomi/lanraragi/thumb"
        "/config/lanraragih:/home/koyomi/lanraragi/database"
      ];
      pull = "newer";
      environment = {
        LRR_UID="0";
        LRR_GID="0";
      };
    };
  };
}
