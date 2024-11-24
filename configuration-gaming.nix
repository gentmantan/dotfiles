{ config, lib, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware.amdgpu.opencl.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.optimise.automatic = true;
  nixpkgs.config.allowUnfree = true;

  services.fwupd.enable = true;

  networking.hostName = "junk";
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

  security.rtkit.enable = true;

  services.udisks2.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-kde pkgs.xdg-desktop-portal-wlr ];
  };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "prohibit-password";
    };
  };

  users.defaultUserShell = pkgs.zsh;

  users.users.game = {
    isNormalUser = true;
    createHome = true;
    packages = [ pkgs.koboldcpp pkgs.vesktop pkgs.librewolf pkgs.alvr pkgs.mpv ];
    extraGroups = [ "wheel" "networkmanager" ];
  };

  environment.systemPackages = [ pkgs.nvtopPackages.full ];

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        set number relativenumber
        filetype plugin indent on
      '';
    };
    viAlias = true;
    vimAlias = true;
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
  };
  programs.tmux = {
    enable = true;
    extraConfig = import ./tmux.conf;
  };
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  virtualisation = {
    containers.enable = true;
    podman.enable = true;
  };

  networking.firewall.enable = false;
  #system.copySystemConfiguration = true;
  system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos#gaming";
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates  = "02:00";
    randomizedDelaySec = "45min";
  };

  system.stateVersion = "24.11"; 

}

