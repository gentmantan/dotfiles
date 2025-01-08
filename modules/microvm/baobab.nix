{
  microvm.vms = {
    baobab = {
      config = {
        microvm.shares = [
        {
          source = "/nix/store";
          mountPoint = "/nix/.ro-store";
          tag = "ro-store";
          proto = "virtiofs";
        }
        {
          source = "/config/baobab";
          mountPoint = "/config";
          tag = "baobab-config";
          proto = "virtiofs";
        }
        {
          source = "/nest0";
          mountPoint = "/nest0";
          tag = "nest0";
          proto = "virtiofs";
        }
        ];
        microvm.interfaces = [
        {
          type = "tap";
          id = "vm-baobab";
          mac = "02:00:00:00:00:01";
        }
        ];
        microvm = {
          vcpu = 12;
          mem = 32768;
        };

        # Begin container related config
        imports = [ 
        ../../modules/tmux.nix
        ../../modules/ssh-server.nix
        ../containers/default-baobab.nix 
        ];

        systemd.network.enable = true;
        systemd.network.networks."10-docker" = {
          matchConfig.Type = "veth*";
          linkConfig = {
            Unmanaged = true;
          };
        };
        systemd.network.networks."20-lan" = {
          matchConfig.Type = "enp*";
          networkConfig = {
            DHCP = "ipv4";
            IPv6AcceptRA = true;
          };
          linkConfig.RequiredForOnline = "routable";
        };
        networking.firewall.enable = false;
        networking.hostName = "baobab";


        users.users.root = {
          openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIRaiMuL8Fr7CmLNg6l0Jsanz47xYKCsehWbBN69v0mn tangy@clipper" ];
          password = "";
        };

        system.stateVersion = "25.05";
      };
    };
  };
}

