{
  lib,
  config,
  ...
}: let
  cfg = config.customNixMaintenance;
in
  with lib; {
    options.customNixMaintenance = {
      enable = mkEnableOption "Enable custom maintenance options";
      hostName = mkOption {
        type = types.str;
        default = "";
        example = "workstation";
        description = "Name of NixOS configuration to be maintained";
      };
      allowReboot = mkOption {
        type = types.bool;
        default = false;
        example = true;
        description = "Reboot the system into the new generation instead of a switch";
      };
    };

    config = mkIf cfg.enable {
      nix.optimise.automatic = true; # Automatically run nix-store --optimise to reduce nix store size
      nix.gc = {
        # Automatically delete old generations
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
      system.autoUpgrade = {
        enable = true;
        flags = ["-L"];
        flake = "github:gentmantan/dotfiles#${cfg.hostName}";
        inherit (cfg) allowReboot;
        dates = "02:00";
        randomizedDelaySec = "45min";
      };
    };
  }
