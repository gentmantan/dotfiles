{
  imports = [ 
    ../../modules/nix-maintenance.nix
    ../../modules/ssh-server.nix
    ../../modules/tmux.nix
    ../../modules/containers/default.nix
    ../../modules/basic-vim.nix
    ./hardware-configuration.nix 
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd = {
    availableKernelModules = [ "igc" "mlx5_core" ];
    network = {
      enable = true;
      ssh = {
        enable = true;
        port = 26572;
        hostKeys = [ "/config/ssh/remote_unlock_ssh_host_ed25519_key" ];
        authorizedKeyFiles = [ ../../.ssh/clipper.pub ];
      };
    };
  };
  boot.zfs.extraPools = [ "flock0" ];

  services.zfs = {
    autoSnapshot.enable = true;
    autoScrub.enable = true;
  };

  zramSwap.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "panamax";
  networking.hostId = "8afd8e00";
  networking.firewall.enable = false;

  time.timeZone = "America/New_York";

  services.fwupd.enable = true;

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
