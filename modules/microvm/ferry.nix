{
  microvm.autostart = [ "ferry" ];
  microvm.vms.ferry.config = {
    microvm.interfaces = [
    {
      type = "user";
      id = "vm-ferry";
      mac = "02:00:00:00:00:02";
    }];
    microvm.shares = [{
      source = "/nix/store";
      mountPoint = "/nix/.ro-store";
      tag = "ro-store";
      proto = "virtiofs";
    }
    {
      source = "/config/games";
      mountPoint = "/config/games";
      tag = "config-games";
      proto = "virtiofs";
    }];
    microvm.volumes = [{
      mountPoint = "/var";
      image = "var.img";
      size = 131072;
    }];
    microvm.forwardPorts = [
    { from = "host"; host.address = "127.0.0.1"; host.port = 21350; guest.port = 48316; }
    ];
    microvm = {
      vcpu = 6;
      mem = 8192;
    };

# Begin ferry system configuration
    imports = [ 
      ../ssh-server.nix
    ];
    networking.firewall.enable = false;
    system.stateVersion = "25.05";
  };
}
