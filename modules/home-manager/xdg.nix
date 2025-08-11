{ pkgs, ... }:
let browser = "io.gitlab.librewolf-community.desktop"; in 
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland xdg-desktop-portal-gtk ];
    xdgOpenUsePortal = true;
  };
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = [ "${browser}" ];
      "x-scheme-handler/http" = [ "${browser}" ];
      "x-scheme-handler/https" = [ "${browser}" ];
      "x-scheme-handler/about" = [ "${browser}" ];
      "x-scheme-handler/unknown" = [ "${browser}" ];
    };
  };
}
