{ pkgs, lib, modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix") ];
  boot.supportedFilesystems = [ "bcachefs" ];
  boot.kernelPackages = lib.mkOverride 0 pkgs.linuxPackages_latest;
  networking.wireless.enable = false;
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIRaiMuL8Fr7CmLNg6l0Jsanz47xYKCsehWbBN69v0mn tangy@clipper" ];

  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        set number relativenumber
	filetype plugin indent on
	tabstop=2
        shiftwidth=2
	expandtab
      '';
    };
    vimAlias = true;
    viAlias = true;
  };

  environment.systemPackages = [ pkgs.parted pkgs.nmap pkgs.testdisk pkgs.partclone pkgs.ddrescue pkgs.rsync pkgs.smartmontools ];
}
