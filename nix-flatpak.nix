{ config, lib, pkgs, ... }:
{
  services.flatpak = { # FIXME: Edit this list with your favorite apps!
    packages = [
      "io.gitlab.librewolf-community"
      "io.freetubeapp.FreeTube"
      "org.mozilla.firefox"
      "org.gnome.Boxes"
      "org.keepassxc.KeePassXC"
      "org.localsend.localsend_app"
      "org.getmonero.Monero"
      "org.gimp.GIMP"
      "chat.simplex.simplex"
      "org.mozilla.Thunderbird"
      "org.torproject.torbrowser-launcher"
      "com.valvesoftware.Steam"
      "com.prusa3d.PrusaSlicer"
      "com.github.johnfactotum.Foliate"
      "org.freecadweb.FreeCAD"
      "com.github.iwalton3.jellyfin-media-player"
      "dev.vencord.Vesktop"
      "com.stremio.Stremio"
    ];
    overrides = {
      global = { # Permissions are set to be quite restrictive by default. I prefer to customize them on a per app basis
                 # Refer to `man flatpak-override` for options
        Context = {
          sockets = [ "wayland" "!x11" "!fallback-x11" "!pulseaudio" "!session-bus" "!system-bus" "!pcsc" "!cups" "!ssh-auth" "!gpg-agent" ]; 
          shared = [ "!ipc" ];
          devices = [ "dri" "!shm" "!all" ];
	  features = [ "!devel" "!multiarch" "!bluetooth" "!canbus" "!per-app-dev-shm" ];
	  filesystems = [ "!host:reset" ];
        }; # TODO: Deny all session and system talks
	Environment = {
          GTK_THEME = "Adwaita:dark";
	  QT_QPA_PLATFORM = "wayland";
	  ELECTRON_OZONE_PLATFORM_HINT = "auto";
	};
      };
      "io.gitlab.librewolf-community".Context = {
        sockets = [ "pulseaudio" ];
        filesystems = [ "xdg-download/librewolf:create" ];
      };
      "io.freetubeapp.FreeTube".Context = {
        sockets = [ "pulseaudio" ];
      };
      "org.mozilla.firefox".Context = {
        sockets = [ "pulseaudio" ];
        filesystems = [ "xdg-download/firefox:create" ];
      };
      "org.keepassxc.KeePassXC".Context = {
        shared = [ "!network" ];
        filesystems = [ "~/KPass" ];
      };
      "org.getmonero.Monero" = {
        Context = {
          filesystems = [ "~/.bitmonero:create" "~/Monero:create" ];
        };
      };
      "org.gimp.GIMP".Context = {
        sockets = [ "x11" ];
      };
      "chat.simplex.simplex".Context = {
        sockets = [ "x11" "pulseaudio" ];
      };
      "org.torproject.torbrowser-launcher".Context = {
        filesystems = [ "xdg-download/torbrowser:create" ];
      };
      "com.valvesoftware.Steam".Context = {
        filesystems = [ "~/games" ];
      };
      "com.prusa3d.PrusaSlicer".Context = {
        sockets = [ "x11" ];
        filesystems = [ "~/projects/3d" ];
      };
      "org.freecad.FreeCAD".Context = {
        sockets = [ "x11" ];
        filesystems = [ "~/projects/3d" ];
      };
      "com.github.iwalton3.jellyfin-media-player".Context = {
        sockets = [ "pulseaudio" ];
      };
      "dev.vencord.Vesktop".Context = {
        sockets = [ "pulseaudio" ];
	filesystems = [ "!~/.steam" ];
      };
    };
    uninstallUnmanaged = true;
    update.auto.enable = true;
  };
}
