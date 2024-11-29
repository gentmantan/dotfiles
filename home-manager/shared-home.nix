{ config, pkgs, lib, ... }:

{
  imports = [ 
      ./bemenu.nix
      ./hypridle.nix
      ./hyprland.nix 
      ./hyprlock.nix
      ./kitty.nix
      ./waybar.nix
      ./zsh.nix
    ];

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.grim
    pkgs.slurp
    pkgs.playerctl
    pkgs.brightnessctl
    pkgs.wl-clipboard
    pkgs.qrencode
    pkgs.nvtopPackages.amd
    pkgs.p7zip
    pkgs.rclone
    pkgs.nmap
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
