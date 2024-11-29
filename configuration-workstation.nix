{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Hardware and bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware.amdgpu.opencl.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

  services.fwupd.enable = true;

  # Enabling nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "clipper"; # FIXME: Choose your hostname
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    nerdfonts
  ];

  security.rtkit.enable = true; # For pipewire
  security.pam.services.hyprlock = {};
  security.sudo.enable = false; # FIXME: Choose if you want to use sudo.
                                # Personally, I prefer using regular user accounts
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
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
  };

  users.users.tangy = { # FIXME: Change the username. Choose wisely!
    isNormalUser = true;
    createHome = true;
    extraGroups = [ "networkmanager" ];
  };

  environment.systemPackages = [ ];

  nixpkgs.config.allowUnfree = false; # FIXME: Choose whether or not to allow non-foss
                                      # nixpkgs packages. Does not apply to flatpaks

  # Shell (can also be configured in ./home-manager)
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
  programs.tmux = {
    enable = true;
    extraConfig = import ./tmux.conf;
  };
  programs.firejail.enable = true;

  virtualisation = {
    containers.enable = true;
    podman.enable = true;
  };

  networking.firewall.enable = false; # FIXME: Choose if you want a firewall

  nix.optimise.automatic = true; # Automatically run nix-store --optimise to reduce nix store size
  nix.gc = { # Automatically delete old generations
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  system.autoUpgrade = { # Automatically upgrade the system
    enable = true;
    flake = "/etc/nixos#workstation";
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
      ];
      dates  = "02:00";
      randomizedDelaySec = "45min";
  };

  system.stateVersion = "24.11"; 

}
