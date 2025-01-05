{
  imports = [ 
    ../../modules/nix-maintenance.nix
    ../../modules/ssh-server.nix
    ../../modules/tmux.nix
    ./hardware-configuration.nix 
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "barquentine";
  networking.hostId = "8afd8e00";
  networking.firewall.enable = false;

  systemd.network.enable = true;

  time.timeZone = "America/New_York";

  services.fwupd.enable = true;

  users.users.root = {
    openssh.authorizedKeys.keyFiles = [ ../../.ssh/clipper.pub ];
  };
  users.users.user = {
    isNormalUser = true;
    createHome = true;
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
