{
  virtualisation.oci-containers.containers = {
    librespeed = {
      image = "ghcr.io/librespeed/speedtest";
      autoStart = true;
      ports = [ "127.0.0.1:54573:8080" ];
      pull = "newer";
      extraOptions = [ "--restart=on-failure" ];
    };
  };
}
