{
  microvm.autostart = [ "skiff" ];
  microvm.vms.skiff.config = {
    microvm.interfaces = [
    {
      type = "user";
      id = "vm-skiff";
      mac = "02:00:00:00:00:03";
    }];
    microvm.shares = [{
      source = "/nix/store";
      mountPoint = "/nix/.ro-store";
      tag = "ro-store";
      proto = "virtiofs";
    }
    {
      source = "/config/restic";
      mountPoint = "/config/restic";
      tag = "config-restic";
      proto = "virtiofs";
    }
    {
      source = "/nest0/immich";
      mountPoint = "/nest0/immich";
      tag = "nest0-immich";
      proto = "virtiofs";
    }
    {
      source = "/nest0/syncthing";
      mountPoint = "/nest0/syncthing";
      tag = "nest0-syncthing";
      proto = "virtiofs";
    }
    {
      source = "/nest1";
      mountPoint = "/nest1";
      tag = "nest1";
      proto = "virtiofs";
    }];
    microvm.forwardPorts = [ { from = "host"; host.address = "127.0.0.1"; host.port = 18561; guest.port = 48316; } ];

# Begin skiff system configuration
    imports = [ 
      ../restic.nix 
      ../ssh-server.nix
    ];

    time.timeZone = "America/New_York";

    system.stateVersion = "25.05";
  };
}
