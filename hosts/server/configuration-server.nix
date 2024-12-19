{ pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/virtualisation/proxmox-lxc.nix")
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = false;
  time.timeZone = "America/New_York";

  services.fwupd.enable = true;

  users.users."root".openssh.authorizedKeys.keyFiles = [
    /etc/nixos/ssh/authorized_keys
  ];

  programs.tmux = {
    enable = true;
    extraConfig = import ./tmux.conf;
  };

  virtualization = {
    containers = {
      enable = true;
      registries.search = [ "docker.io" "ghcr.io" ];
    };
    podman = {
      enable = true;
      autoPrune.enable = true;
    };
    oci-containers.backend = "podman";
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "prohibit-password";
    };
  };

  networking.firewall.enable = false;

  nix.optimise.automatic = true; # Automatically run nix-store --optimise to reduce nix store size
  nix.gc = { # Automatically delete old generations
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  system.autoUpgrade = { # Automatically upgrade the system
    enable = true;
    flake = "/etc/nixos#server";
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
      ];
      dates  = "02:00";
      randomizedDelaySec = "45min";
  };
}
