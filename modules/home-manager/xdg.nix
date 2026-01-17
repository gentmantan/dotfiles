{pkgs, ...}: let
  audio = "mpv.desktop";
  browser = "io.gitlab.librewolf-community.desktop";
  document = "org.pwmt.zathura.desktop";
  image = "imv-dir.desktop";
  video = "mpv.desktop";
in {
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-hyprland xdg-desktop-portal-gtk];
    xdgOpenUsePortal = true;
  };
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/epub+zip" = ["${document}"];
      "application/pdf" = ["${document}"];
      "audio/aac" = ["${audio}"];
      "audio/flac" = ["${audio}"];
      "audio/mpeg" = ["${audio}"];
      "audio/ogg" = ["${audio}"];
      "image/gif" = ["${image}"];
      "image/jpeg" = ["${image}"];
      "image/png" = ["${image}"];
      "image/webp" = ["${image}"];
      "text/html" = ["${browser}"];
      "text/xml" = ["${browser}"];
      "video/matroska" = ["${video}"];
      "video/mp4" = ["${video}"];
      "video/mpeg" = ["${video}"];
      "video/webm" = ["${video}"];
      "x-scheme-handler/http" = ["${browser}"];
      "x-scheme-handler/https" = ["${browser}"];
    };
  };
}
