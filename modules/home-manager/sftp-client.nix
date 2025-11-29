{
  programs.rclone = {
    enable = true;
    remotes.nest0 = {
      config = {
        type = "sftp";
        host = "technophile.zone";
        port = 48316;
        user = "root";
        key_file = "/home/tangy/.ssh/id_ed25519";
      };
      mounts = {
        "/nest0" = {
          enable = true;
          mountPoint = "/home/tangy/nest0";
          options = {
            vfs-cache-mode = "writes";
            dir-cache-time = "5s";
            vfs-cache-max-size = "50G";
            vfs-cache-max-age = "5s";
            umask = "007";
          };
        };
      };
    };
  };
}
