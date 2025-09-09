{modulesPath, ...}: {
  imports = ["${modulesPath}/virtualisation/amazon-image.nix" ../../modules/basic-vim.nix];
  ec2.efi = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  time.timeZone = "America/New_York";
  networking.firewall.enable = false;
  system.stateVersion = "25.11";
}
