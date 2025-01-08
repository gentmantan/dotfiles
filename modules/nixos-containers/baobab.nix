{ lib, ... }:
{
  containers.baobab = {
    autoStart = true;
    privateNetwork = true;
    hostBridge = "br0";
    config = {
      imports = [ 
        ../../modules/tmux.nix
        ../../modules/ssh-server.nix
        ../../modules/oci-containers/default-baobab.nix
      ];

      networking.firewall.enable = false;
      networking.hostName = "baobab";
      networking.useDHCP = lib.mkForce true;
      services.resolved.enable = true;

      users.users.root = {
        openssh.authorizedKeys.keyFiles = [ ../../.ssh/clipper.pub ];
        password = "";
      };

      system.stateVersion = "25.05";
    };
  };
}
