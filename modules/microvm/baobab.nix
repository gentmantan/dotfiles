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
        systemd.network.enable = true;
        systemd.network.networks."20-lan" = {
          matchConfig.Type = "veth*";
          networkConfig = {
            DHCP = "yes";
          };
          linkConfig = {
            Unmanaged = true;
          };
        };
        networking.firewall.enable = false;
        networking.hostName = "baobab";

        services.openssh = {
          enable = true;
          ports = [ 22 ];
          settings = {
            PasswordAuthentication = false;
            PermitRootLogin = "prohibit-password";
          };
        };

        users.users.root = {
          openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIRaiMuL8Fr7CmLNg6l0Jsanz47xYKCsehWbBN69v0mn tangy@clipper" ];
          password = "";
        };

        virtualisation = {
          containers.enable = true;
          podman.enable = true;
          oci-containers.backend = "podman";
          oci-containers.containers = {
            iperf3 = {
              image = "docker.io/networkstatic/iperf3";
              autoStart = true;
              ports = [ "15555:5201" ];
              pull = "newer";
              extraOptions = [ "-it" ];
              cmd = [ "-s" ];
            };
          };
        };
        system.stateVersion = "25.05";
      };
    };
  };
}

