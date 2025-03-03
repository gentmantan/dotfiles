{
  # Choose which containers are present in which systems
  imports = [ 
    ./bookstack.nix
    ./caddy.nix
    ./immich.nix
    ./jdownloader.nix
    ./jellyfin.nix
    ./librespeed.nix
    ./privatebin.nix
  ];
  virtualisation = {
    containers.enable = true;
    podman.enable = true;
    oci-containers.backend = "podman";
  };
}
