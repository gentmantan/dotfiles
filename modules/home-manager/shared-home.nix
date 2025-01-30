{ pkgs, ...}:

{
  imports = [ 
      ./bemenu.nix
      ./hypridle.nix
      ./hyprland.nix 
      ./hyprlock.nix
      ./kitty.nix
      ./mako.nix
      ./waybar.nix
      ./zsh.nix
    ];

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.brightnessctl
    pkgs.grim
    pkgs.hyprsunset
    pkgs.nmap
    pkgs.p7zip
    pkgs.plantuml-c4
    pkgs.playerctl
    pkgs.qrencode
    pkgs.quickemu
    pkgs.rclone
    pkgs.slurp
    pkgs.wl-clipboard
    pkgs.wl-screenrec
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  programs.home-manager.enable = true;
  programs.xplr.enable = true;
  programs.imv.enable = true;
  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.mpris ];
  };
  programs.yt-dlp.enable = true;
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set selection-clipboard clipboard
    '';
  };

  services.playerctld.enable = true;
  # services.hyprpaper = { # FIXME: Set your wallpaper here
  #   enable = true;
  #   settings = {
  #     ipc = "on";
  #     splash = false;
  #     preload = [ "~/Pictures/ceres-fauna-nature.jpg" ];
  #     wallpaper = [ ",~/Pictures/ceres-fauna-nature.jpg" ];
  #   };
  # };
}
