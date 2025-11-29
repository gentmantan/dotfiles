{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "p" = {
        hostname = "technophile.zone";
        user = "root";
        port = 48316;
        setEnv = {term = "xterm-256color";};
      };
      "unlockp" = {
        hostname = "technophile.zone";
        user = "root";
        port = 26572;
        setEnv = {term = "xterm-256color";};
      };
      "b" = {
        hostname = "localhost";
        port = 21349;
        proxyJump = "p";
        setEnv = {term = "xterm-256color";};
        user = "root";
        userKnownHostsFile = "/dev/null";
      };
      "f" = {
        hostname = "localhost";
        port = 21350;
        proxyJump = "p";
        setEnv = {term = "xterm-256color";};
        user = "root";
        userKnownHostsFile = "/dev/null";
      };
    };
  };
}
