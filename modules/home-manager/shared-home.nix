{pkgs, ...}: let
  enableWithNushell = {
    enable = true;
    enableNushellIntegration = true;
  };
in {
  imports = [
    ./bemenu.nix
    ./hyprcursor.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./kitty.nix
    ./mako.nix
    ./nushell.nix
    ./waybar.nix
    ./xdg.nix
  ];

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    brightnessctl
    grim
    hyprsunset
    nmap
    p7zip
    plantuml-c4
    playerctl
    qrencode
    quickemu
    rclone
    slurp
    wl-clipboard
    wl-screenrec
  ];

  programs = {
    home-manager.enable = true;
    imv.enable = true;
    mpv = {
      enable = true;
      scripts = [pkgs.mpvScripts.mpris pkgs.mpvScripts.vr-reversal];
    };
    yt-dlp.enable = true;
    zathura = {
      enable = true;
      extraConfig = ''
        set selection-clipboard clipboard
      '';
    };
    ripgrep.enable = true;

    # Shell utilities
    carapace = enableWithNushell;
    yazi = enableWithNushell;
    starship = enableWithNushell;
    zoxide = enableWithNushell;
  };
  services.playerctld.enable = true;
}
