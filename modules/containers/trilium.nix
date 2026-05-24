{
  virtualisation.oci-containers.containers = {
    trilium = {
      image = "ghcr.io/triliumnext/trilium";
      autoStart = true;
      ports = ["127.0.0.1:47812:8080"];
      volumes = [
        "/nest0/trilium:/home/node/trilium-data"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
    };
  };
}
