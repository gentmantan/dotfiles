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
    }
    {
      source = "/config/env/games";
      mountPoint = "/config/env/games";
      tag = "config-env-games";
      proto = "virtiofs";
    }];
    microvm.volumes = [{
      mountPoint = "/var";
      image = "var.img";
      size = 131072;
    }];
    microvm.forwardPorts = [
    { from = "host"; host.address = "127.0.0.1"; host.port = 21350; guest.port = 48316; }
    { from = "host"; host.port = 27873; guest.port = 27873; proto = "udp"; } # Palworld
    { from = "host"; host.port = 27874; guest.port = 27874; proto = "udp"; } # Core Keeper 
    { from = "host"; host.port = 27875; guest.port = 27875; proto = "tcp"; } # Terraria-1 (Tarraria)
    { from = "host"; host.port = 27876; guest.port = 27876; proto = "udp"; } # Factorio 
    { from = "host"; host.port = 27877; guest.port = 27877; proto = "tcp"; } # Valheim 
    { from = "host"; host.port = 27878; guest.port = 27878; proto = "tcp"; } # Terraria-2 (The Buasterlands)
    { from = "host"; host.port = 27879; guest.port = 27879; proto = "tcp"; } # Terraria-3 (The Buasterlands 2 Modded)
    { from = "host"; host.port = 27880; guest.port = 27880; proto = "udp"; } # Zomboid-1 Query Port 
    { from = "host"; host.port = 27881; guest.port = 27881; proto = "udp"; } # Zomboid-1 Direct Connection Port
    { from = "host"; host.port = 27882; guest.port = 27882; proto = "udp"; } # Zomboid-2 Query Port
    { from = "host"; host.port = 27883; guest.port = 27883; proto = "udp"; } # Zomboid-2 Direct Connection Port
    ];
    microvm = {
      vcpu = 6;
      mem = 16384;
    };

# Begin ferry system configuration
    imports = [ 
      ../containers/default-ferry.nix 
      ../ssh-server.nix
    ];
    networking.firewall.enable = false;

    time.timeZone = "America/New_York";

    system.stateVersion = "25.05";
  };
}
