{
  imports = [
    ../../modules/basic-vim.nix
    ../../modules/containers/podman.nix
    ../../modules/nix-maintenance.nix
    ../../modules/ssh-server.nix
    ../../modules/tmux.nix
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  zramSwap.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "PAT0D0C";
  networking.firewall.enable = false;

  time.timeZone = "America/New_York";

  services.fwupd.enable = true;

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  customNixMaintenance = {
    enable = true;
    hostName = "work-server";
  };

  system.stateVersion = "25.05";
}
