{pkgs, ...}: {
  imports = [
    ../../modules/fonts.nix
    ../../modules/nix-maintenance.nix
    ../../modules/ssh-server.nix
    ../../modules/tmux.nix
    ../../modules/basic-vim.nix
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = ["bcachefs"];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = ["amdgpu"];

  hardware.amdgpu.opencl.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.optimise.automatic = true;
  nixpkgs.config.allowUnfree = true;

  # TODO: Programs, services etc. should be in separate nix files for better composability

  services.fwupd.enable = true;

  networking.hostName = "coracle";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

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
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde pkgs.xdg-desktop-portal-wlr];
  };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  users.defaultUserShell = pkgs.bash;
  users.users.game = {
    isNormalUser = true;
    createHome = true;
    packages = [pkgs.koboldcpp pkgs.vesktop pkgs.librewolf pkgs.alvr pkgs.mpv pkgs.rclone];
    extraGroups = ["wheel" "networkmanager" "adbusers"];
    openssh.authorizedKeys.keyFiles = [../../.ssh/clipper.pub];
  };
  systemd.user.services = {
    gamesftp = {
      enable = true;
      wantedBy = ["default.target"];
      after = ["network.target"];
      description = "Mount gamesftp";
      serviceConfig = {
        ExecStartPre = "/run/current-system/sw/bin/mkdir -p /home/game/gamesftp";
        ExecStart = "${pkgs.rclone}/bin/rclone mount gamesftp: /home/game/gamesftp --vfs-cache-mode writes --vfs-cache-max-size 50G --vfs-cache-max-age 10s --umask 227";
        ExecStop = "/run/wrappers/bin/fusermount -u /home/game/gamesftp";
        Restart = "on-failure";
        RestartSec = "10s";
        Environment = ["PATH=/run/wrappers/bin/:$PATH"];
      };
      startLimitBurst = 10;
      startLimitIntervalSec = 10;
    };
  };

  environment.systemPackages = [pkgs.nvtopPackages.full];

  programs.adb.enable = true;

  programs.git = {
    enable = true;
    lfs.enable = true;
  };
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      protontricks.enable = true;
    };
  };
  programs.virt-manager.enable = true;

  virtualisation = {
    containers.enable = true;
    podman.enable = true;
    libvirtd.enable = true;
  };

  networking.firewall.enable = false;

  customNixMaintenance = {
    enable = true;
    hostName = "gaming";
  };

  system.stateVersion = "24.11";
}
