{pkgs, ...}: let
  browser = "io.gitlab.librewolf-community.desktop";
  image = "imv-dir.desktop";
  video = "mpv.desktop";
  document = "org.pwmt.zathura.desktop";
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
      "application/pdf" = ["${document}"];
      "application/epub+zip" = ["${document}"];
      "image/gif" = ["${image}"];
      "image/jpeg" = ["${image}"];
      "image/png" = ["${image}"];
      "image/webp" = ["${image}"];
      "text/html" = ["${browser}"];
      "text/xml" = ["${browser}"];
      "x-scheme-handler/http" = ["${browser}"];
      "x-scheme-handler/https" = ["${browser}"];
    };
  };
}
