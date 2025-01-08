{
  containers.baobab = {
    autoStart = true;
    privateNetwork = true;
    hostBridge = "br0";
    localAddress = "192.168.0.7/24";
    config = {
      imports = [ 
        ../../modules/tmux.nix
        ../../modules/ssh-server.nix
      ];

      networking.firewall.enable = false;
      networking.hostName = "baobab";

      users.users.root = {
        openssh.authorizedKeys.keyFiles = [ ../../.ssh/clipper.pub ];
        password = "";
      };

      system.stateVersion = "25.05";
    };
  };
}
