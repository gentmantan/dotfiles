{
  imports = [
    ../../modules/basic-vim.nix
    ../../modules/containers/default-panamax.nix
    ../../modules/nix-maintenance.nix
    ../../modules/restic.nix
    ../../modules/ssh-server.nix
    ../../modules/tmux.nix
    ./hardware-configuration.nix
  ];

  boot = {
    crashDump.enable = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = ["zfs"];
    zfs.extraPools = ["flock0" "flock1"];
    zfs.forceImportRoot = false;
  };

  services.zfs = {
    autoSnapshot = {
      enable = true;
      monthly = 1;
      weekly = 2;
    };
    autoScrub.enable = true;
  };

  zramSwap.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

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
