{
  imports = [ 
    ./baobab.nix 
  #  ./mangrove.nix 
  ];

  # Bridge networking puts VMs onto upstream LAN
  networking.useNetworkd = true;
  systemd.network.netdevs."br0" = {
    netdevConfig = {
      Name = "br0";
      Kind = "bridge";
    };
  };
  systemd.network.networks."10-bridge" = {
    matchConfig.Name = "br0";
    networkConfig = {
      DHCP = "ipv4";
      IPv6AcceptRA = true;
    };
    linkConfig.RequiredForOnline = "routable";
  };
  systemd.network.networks."20-lan" = {
    matchConfig.Name = ["enp113s0" "vm-*"];
    networkConfig = {
      Bridge = "br0";
    };
    linkConfig.RequiredForOnline = "enslaved";
  };

  microvm.autostart = [
    "baobab"
  #  "mangrove"
  ];

}
