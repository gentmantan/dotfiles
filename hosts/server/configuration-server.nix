{
  imports = [ 
    ../../modules/nix-maintenance.nix
    ../../modules/ssh-server.nix
    ../../modules/tmux.nix
    ../../modules/containers/default.nix
    ./hardware-configuration.nix 
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "barquentine";
  networking.hostId = "8afd8e00";
  networking.firewall.enable = false;

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
