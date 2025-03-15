{
  microvm.autostart = [ "barge" ];
  microvm.vms.barge.config = {
    microvm.interfaces = [
    {
      type = "user";
      id = "vm-barge";
      mac = "02:00:00:00:00:01";
    }];
    microvm.shares = [{
      source = "/nix/store";
      mountPoint = "/nix/.ro-store";
      tag = "ro-store";
      proto = "virtiofs";
    }
    {
      source = "/config/qbittorrent";
      mountPoint = "/config/qbittorrent";
      tag = "config-qbittorrent";
      proto = "virtiofs";
    }
    {
      source = "/config/wireguard";
      mountPoint = "/config/wireguard";
      tag = "config-wireguard";
      proto = "virtiofs";
    }
    {
      source = "/nest0/torrents";
      mountPoint = "/nest0/torrents";
      tag = "torrents";
      proto = "virtiofs";
    }];
    microvm.volumes = [{
      mountPoint = "/var";
      image = "var.img";
      size = 32768;
    }];
    microvm.forwardPorts = [
    { from = "host"; host.address = "127.0.0.1"; host.port = 16190; guest.port = 16190; }
    { from = "host"; host.address = "127.0.0.1"; host.port = 21349; guest.port = 48316; }
    ];
    microvm = {
      vcpu = 6;
      mem = 8192;
    };

    # Begin barge system configuration
    imports = [ 
      ../containers/default-barge.nix 
      ../ssh-server.nix
    ];
    networking.wg-quick.interfaces.wg0 = {
      configFile = "/config/wireguard/wg0.conf";
    };
    networking.nameservers = [ "10.128.0.1" ];
    services.resolved.fallbackDns = [];

    system.stateVersion = "25.05";
  };
}
