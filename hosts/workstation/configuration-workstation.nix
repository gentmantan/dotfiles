{ pkgs, ... }:

{
  imports = [ 
    ../../modules/fonts.nix
    ../../modules/nix-maintenance.nix
    ../../modules/tmux.nix
    ./hardware-configuration.nix 
  ];

  # Hardware and bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

  zramSwap.enable = true;

  services.fwupd.enable = true;

  # Enabling nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "clipper"; # FIXME: Choose your hostname
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  security.rtkit.enable = true; # For pipewire
  security.pam.services.hyprlock = {};
  security.sudo.enable = false; # FIXME: Choose if you want to use sudo.
                                # Personally, I prefer using regular user accounts
  services.fprintd.enable = true;

  services.displayManager.ly = {
    enable = false;
    settings = {
      animation = "gameoflife";
      vi_mode = true;
    };
  };

  # Printing
  # FIXME: You can declaratively add your printers here. Refer to the NixOS wiki
   services.printing.enable = true;
   services.avahi = {
     enable = true;
     nssmdns4 = true;
     openFirewall = true;
   };

  services.udisks2.enable = true; # To allow regular users to mount storage devices

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.flatpak.enable = true;
  environment.pathsToLink = [ 
    "/share/xdg-desktop-portal" 
    "/share/applications" 
  ]; # Fix xdg portal definitions

  services.pcscd.enable = true;

  services.auto-cpufreq.enable = true;

  users.users.tangy = { # FIXME: Change the username. Choose wisely!
    isNormalUser = true;
    createHome = true;
    extraGroups = [ "networkmanager" ];
  };

  environment.systemPackages = [ ];

  nixpkgs.config.allowUnfree = false; # FIXME: Choose whether or not to allow non-foss
                                      # nixpkgs packages. Does not apply to flatpaks

  # Shell (configured in /modules/home-manager/zsh.nix)
  users.defaultUserShell = pkgs.zsh; 

  # Programs
  # If available, programs should be enabled here as a module
  # as opposed to in environment.systemPackages
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
  programs.hyprland.enable = true;

  virtualisation = {
    containers.enable = true;
    podman.enable = true;
    spiceUSBRedirection.enable = true;
  };

  networking.firewall.enable = false; # FIXME: Choose if you want a firewall

  customNixMaintenance = {
    enable = true;
    hostName = "workstation";
  };

  system.stateVersion = "24.11"; 
}
