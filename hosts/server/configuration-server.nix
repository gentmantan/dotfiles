{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "barquentine";
  networking.hostId = "8afd8e00";
  networking.networkmanager.enable = true;  
  networking.firewall.enable = false;

  time.timeZone = "America/New_York";

  services.fwupd.enable = true;
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "prohibit-password";
    };
  };

  users.users.root = {
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIRaiMuL8Fr7CmLNg6l0Jsanz47xYKCsehWbBN69v0mn tangy@clipper" ];
  };
  users.users.user = {
    isNormalUser = true;
    createHome = true;
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIRaiMuL8Fr7CmLNg6l0Jsanz47xYKCsehWbBN69v0mn tangy@clipper" ];
  };

  programs.tmux = {
    enable = true;
    extraConfig = import ../../modules/tmux.conf;
  };
  programs.git = {
    enable = true;
    lfs.enable = true;
  };
  # microvm.autostart = [
  #   "baobab"
  #   "mangrove"
  # ];

  nix.optimise.automatic = true; # Automatically run nix-store --optimise to reduce nix store size
  nix.gc = { # Automatically delete old generations
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  system.stateVersion = "25.05";
}
