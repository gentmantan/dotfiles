{
  # Choose which containers are present in which systems
  imports = [ 
    ./bookstack.nix
    ./caddy.nix
    ./homeassistant.nix
    ./immich.nix
    ./iperf.nix
    ./jdownloader.nix
    ./jellyfin.nix
    ./komga.nix
    ./lanraragi.nix
    ./librespeed.nix
    ./privatebin.nix
    ./samba.nix
    ./sillytavern.nix
    ./syncthing.nix
  ];
  virtualisation = {
    containers.enable = true;
    podman.enable = true;
    oci-containers.backend = "podman";
  };
}
