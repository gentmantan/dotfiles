{ lib, config, ... }:
let cfg = config.customNixMaintenance; in
with lib;
{
  options.customNixMaintenance = {
    enable = mkEnableOption "Enable custom maintenance options";
    hostName = mkOption {
      type = types.str;
      default = "";
      example = "workstation";
      description = "Name of NixOS configuration to be maintained";
    };
  };

  config = mkIf cfg.enable {
    nix.optimise.automatic = true; # Automatically run nix-store --optimise to reduce nix store size
    nix.gc = { # Automatically delete old generations
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    system.autoUpgrade = {
      enable = true;
      flake = "github:gentmantan/dotfiles#${cfg.hostName}";
      flags = [ "-L" ];
      dates = "02:00";
      randomizedDelaySec = "45min";
    };
  };
}
