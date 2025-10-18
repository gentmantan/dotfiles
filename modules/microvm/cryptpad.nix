{
  microvm.autostart = ["cryptpad"];
  microvm.vms.cryptpad.config = {
    microvm.interfaces = [
      {
        type = "user";
        id = "vm-cryptpad";
        mac = "02:00:00:00:00:01";
      }
    ];
    microvm.shares = [
      {
        source = "/nix/store";
        mountPoint = "/nix/.ro-store";
        tag = "ro-store";
        proto = "virtiofs";
      }
    ];
    microvm.volumes = [
      {
        mountPoint = "/var";
        image = "var.img";
        size = 32768;
      }
    ];
    microvm.forwardPorts = [
      {
        from = "host";
        host.address = "127.0.0.1";
        host.port = 10338;
        guest.port = 3000;
      } # CryptPad
      {
        from = "host";
        host.address = "127.0.0.1";
        host.port = 18525;
        guest.port = 48316;
      } # SSH
    ];
    microvm = {
      vcpu = 4;
      mem = 8192;
    };

    # Begin barge system configuration
    imports = [
      ../ssh-server.nix
    ];
    networking.firewall.enable = false;

    services.cryptpad = {
      enable = true;
      settings = {
        httpSafeOrigin = "https://office.technophile.zone";
        httpUnsafeOrigin = "https://office.technophile.zone";
        httpAddress = "0.0.0.0";
        adminKeys = [
          "[admin@office.technophile.zone/YzL69KNEIxsQXRF9unt3D3jVSTpBmVb7fIdBVYPCDUk=]"
        ];
      };
    };

    time.timeZone = "America/New_York";

    system.stateVersion = "25.05";
  };
}
