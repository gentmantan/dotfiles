{
  # Choose which containers are present in which systems
  imports = [ 
    ./iperf.nix 
    ./jdownloader.nix
    ./immich.nix
  ];
  virtualisation = {
    containers.enable = true;
    podman.enable = true;
    oci-containers.backend = "podman";
  };
}
