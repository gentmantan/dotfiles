{
  virtualisation.oci-containers.containers = {
    frigate = {
      image = "ghcr.io/blakeblackshear/frigate:stable-rocm";
      autoStart = true;
      ports = ["127.0.0.1:19773:8971"];
      volumes = [
        "/nest0/frigate/storage:/media/frigate"
        "/nest0/frigate/config:/config"
        "/etc/localtime:/etc/localtime:ro"
      ];
      devices = ["/dev/dri" "/dev/kfd"];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environment = {
        TZ = "America/New_York";
      };
      extraOptions = [
        "--shm-size=512mb"
        "--mount=type=tmpfs,target=/tmp/cache,tmpfs-size=1000000000"
      ];
    };
  };
}
