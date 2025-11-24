{
  pkgs,
  lib,
  modulesPath,
  ...
}:
with pkgs; {
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix")
    ../../modules/tmux.nix
    ../../modules/basic-vim.nix
    ../../modules/ssh-server.nix
  ];
  networking.wireless.enable = false;
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = [
    chntpw
    clamav
    ddrescue
    dmidecode
    lshw
    memtest86plus
    nmap
    partclone
    parted
    rsync
    s-tui
    smartmontools
    stress-ng
    testdisk
  ];
}
