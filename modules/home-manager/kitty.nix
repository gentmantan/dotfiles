{ config, pkgs, lib, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      background_opacity = "0.5";
      background_blur = 5;
      font_family = "Noto Sans";
    };
  };
}
