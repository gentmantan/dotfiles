{
  microvm.vms = {
    baobab = {
      config = {
        microvm.shares = [{
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
        }];

        networking.hostName = "baobab";
        users.users.root.password = "";

        virtualisation = {
          containers.enable = true;
          podman.enable = true;
          oci-containers.backend = "podman";
        };
        virtualisation.containers = {
          # TODO: add containers
        };
      };
    };
  };
}

