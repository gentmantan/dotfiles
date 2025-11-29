{
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      autoPrune.enable = true;
    };
    oci-containers.backend = "podman";
  };
  systemd.timers."podman-auto-update".wantedBy = ["timers.target"];
}
