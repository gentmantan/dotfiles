{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "p" = {
        HostName = "technophile.zone";
        Port = 48316;
        User = "root";
      };
      "unlockp" = {
        HostName = "technophile.zone";
        Port = 26572;
        User = "root";
      };
      "b" = {
        HostName = "localhost";
        Port = 21349;
        ProxyJump = "p";
        User = "root";
        UserKnownHostsFile = "/dev/null";
      };
      "f" = {
        HostName = "localhost";
        Port = 21350;
        ProxyJump = "p";
        User = "root";
        UserKnownHostsFile = "/dev/null";
      };
      "ws" = {
        HostName = "pat4e0e.ad.fiu.edu";
        Port = 48316;
        User = "root";
      };
      "an" = {
        HostName = "pat-analytics.ad.fiu.edu";
        User = "root";
      };
      "ap" = {
        HostName = "pat-apps.ad.fiu.edu";
        User = "root";
      };
      "*" = {
        SetEnv = {TERM = "xterm-256color";};
      };
    };
  };
}
