{ pkgs, lib, modulesPath, ... }:
with pkgs;
{
  imports = [ 
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal-new-kernel.nix") 
    ../../modules/tmux.nix
    ../../modules/basic-vim.nix
    ../../modules/ssh-server.nix
  ];
  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = lib.mkOverride 0 linuxPackages_latest;
  networking.wireless.enable = false;
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = [ 
    chntpw
    clamav
    ddrescue
    dmidecode
    lshw
    nmap
    partclone
    parted
    rsync
    smartmontools
    testdisk
  ];
}
