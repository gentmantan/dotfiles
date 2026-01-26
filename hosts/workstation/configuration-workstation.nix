{pkgs, ...}: {
  imports = [
    ../../modules/containers/podman.nix
    ../../modules/dms-shell.nix
    ../../modules/fonts.nix
    ../../modules/nix-maintenance.nix
    ../../modules/pipewire.nix
    ../../modules/tmux.nix
    ./hardware-configuration.nix
  ];

  # Hardware and bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = ["amdgpu.dcdebugmask=0x10"];
  boot.initrd.systemd.enable = true;

  hardware.bluetooth.enable = true;

  zramSwap.enable = true;

  services.fwupd.enable = true;

  # Enabling nix flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "clipper"; # FIXME: Choose your hostname
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  security.sudo.enable = false; # FIXME: Choose if you want to use sudo.
  # Personally, I prefer using regular user accounts
  services.fprintd.enable = true;

  services.udisks2.enable = true; # To allow regular users to mount storage devices
  services.flatpak.enable = true;

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  users.users.tangy = {
    # FIXME: Change the username. Choose wisely!
    isNormalUser = true;
    createHome = true;
    extraGroups = ["networkmanager"];
    shell = pkgs.nushell;
  };

  environment.systemPackages = [];

  nixpkgs.config.allowUnfree = false; # FIXME: Choose whether or not to allow non-foss
  # nixpkgs packages. Does not apply to flatpaks

  # Programs
  # If available, programs should be enabled here as a module
  # as opposed to in environment.systemPackages
  programs.niri.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

  networking.firewall.enable = false; # FIXME: Choose if you want a firewall

  customNixMaintenance = {
    enable = true;
    hostName = "workstation";
  };

  system.stateVersion = "24.11";
}
