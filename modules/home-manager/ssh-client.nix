{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "p" = {
        hostname = "technophile.zone";
        port = 48316;
        user = "root";
      };
      "unlockp" = {
        hostname = "technophile.zone";
        port = 26572;
        user = "root";
      };
      "b" = {
        hostname = "localhost";
        port = 21349;
        proxyJump = "p";
        user = "root";
        userKnownHostsFile = "/dev/null";
      };
      "f" = {
        hostname = "localhost";
        port = 21350;
        proxyJump = "p";
        user = "root";
        userKnownHostsFile = "/dev/null";
      };
      "ws" = {
        hostname = "10.101.20.33";
        port = 48316;
        user = "root";
      };
      "*" = {
        setEnv = {TERM = "xterm-256color";};
      };
    };
  };
}
