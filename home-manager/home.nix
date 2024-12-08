{ config, pkgs, ... }:

{
  imports = [ ./shared-home.nix ];
  home.username = "tangy";
  programs.git = { # FIXME: Use your own git credentials!
    enable = true;
    lfs.enable = true;
    userName = "Gentman Tan";
    userEmail = "gentmantan@gmail.com";
  };
  programs.gh = {
    enable = true;
  };
  services.syncthing = {
    enable = true;
    extraOptions = [
      "--gui-address=127.0.0.1:8384"
    ];
  };
  systemd.user.services = { # FIXME: This is an example of an sshfs/sftp mount. Adjust to your liking or comment out if you don't want to use it
    nest0sftp = {
      Unit = {
        Description = "Mount nest0";
        After = "network.target";
      };
      Service = {
        ExecStart = "${pkgs.rclone}/bin/rclone mount nest0:/nest0 /home/tangy/nest0 --vfs-cache-mode writes --vfs-cache-max-size 50G --vfs-cache-max-age 10s --umask 227";
        ExecStop = "/run/wrappers/bin/umount /home/tangy/nest0";
        Restart = "on-failure";
        RestartSec = "5s";
        StartLimitBurst = 10;
        StartLimitInterval = "10s";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}

