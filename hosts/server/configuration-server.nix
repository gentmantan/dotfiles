{
  imports = [ 
    ../../modules/nix-maintenance.nix
    ../../modules/ssh-server.nix
    ../../modules/tmux.nix
    ./hardware-configuration.nix 
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd = {
    availableKernelModules = [ "igc" ];
    network = {
      enable = true;
      ssh = {
        enable = true;
        port = 2222;
        hostKeys = [ /config/ssh/remote_unlock_ssh_host_ed25519_key ];
        authorizedKeyFiles = [ ../../.ssh/clipper.pub ];
      };
    };
  };
  boot.zfs.extraPools = [ "flock0" ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "panamax";
  networking.hostId = "8afd8e00";
  networking.firewall.enable = false;

  systemd.network.enable = true;

  time.timeZone = "America/New_York";

  services.fwupd.enable = true;

  users.users.root = {
    openssh.authorizedKeys.keyFiles = [ ../../.ssh/clipper.pub ];
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  customNixMaintenance = {
    enable = true;
    hostName = "server";
  };

  system.stateVersion = "25.05";
}
