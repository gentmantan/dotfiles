{
  # Choose which containers are present in which systems
  imports = [ 
    ./bookstack.nix
    ./caddy.nix
    ./jdownloader.nix
    ./librespeed.nix
    ./privatebin.nix
  ];
  virtualisation = {
    containers.enable = true;
    podman.enable = true;
    oci-containers.backend = "podman";
  };
}
