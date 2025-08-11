{
  services.flatpak = { # FIXME: Edit this list with your favorite apps!
                       # Note that the first installation may take long with too many apps  
    packages = [
      "at.vintagestory.VintageStory"
      "com.github.IsmaelMartinez.teams_for_linux"
      "com.github.iwalton3.jellyfin-media-player"
      "com.github.johnfactotum.Foliate"
      "com.google.AndroidStudio"
      "com.obsproject.Studio"
      "com.prusa3d.PrusaSlicer"
      "com.rustdesk.RustDesk"
      "com.stremio.Stremio"
      "com.usebottles.bottles"
      "com.valvesoftware.Steam"
      "dev.vencord.Vesktop"
      "io.freetubeapp.FreeTube"
      "io.github.ungoogled_software.ungoogled_chromium"
      "io.gitlab.librewolf-community"
      "net.ankiweb.Anki"
      "net.werwolv.ImHex"
      "org.audacityteam.Audacity"
      "org.freecad.FreeCAD"
      "org.getmonero.Monero"
      "org.gimp.GIMP"
      "org.kde.kdenlive"
      "org.keepassxc.KeePassXC"
      "org.localsend.localsend_app"
      "org.mozilla.Thunderbird"
      "org.mozilla.firefox"
      "org.onlyoffice.desktopeditors"
      "org.openscad.OpenSCAD"
      "org.prismlauncher.PrismLauncher"
      "org.signal.Signal"
      "org.torproject.torbrowser-launcher"
      "us.zoom.Zoom"
    ];
    overrides = {
      global = { # Permissions are set to be quite restrictive by default. I prefer to customize them on a per app basis
                 # Refer to `man flatpak-override` for options
        Context = {
          sockets = [ "wayland" "!x11" "!fallback-x11" "!pulseaudio" "!session-bus" "!system-bus" "!pcsc" "!cups" "!ssh-auth" "!gpg-agent" ]; 
          shared = [ "!ipc" ];
          devices = [ "dri" "!shm" "!kvm" "!all" "!usb" "!input" ];
          features = [ "!devel" "!multiarch" "!bluetooth" "!canbus" "!per-app-dev-shm" ];
          filesystems = [ "!host:reset" ];
        };
        Environment = {
          GTK_THEME = "Adwaita:dark";
          QT_QPA_PLATFORM = "wayland";
          ELECTRON_OZONE_PLATFORM_HINT = "auto";
        };
        "System Bus Policy" ={
          "org.freedesktop.UPower" = "none";
          "org.freedesktop.UDisks2" = "none";
        };
        "Session Bus Policy" = { # Deny some known sandbox escape permissions
          "org.freedesktop.Flatpak" = "none";
          "org.freedesktop.impl.portal.PermissionStore" = "none";
          "org.freedesktop.secrets" = "none";
        };
      };
      "io.gitlab.librewolf-community".Context = {
        sockets = [ "pulseaudio" "cups" ];
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
      "org.getmonero.Monero".Context = {
        filesystems = [ "~/Monero:create" ];
      };
      "org.gimp.GIMP".Context = {
        filesystems = [ "xdg-pictures" ];
      };
      "chat.simplex.simplex".Context = {
        sockets = [ "x11" "pulseaudio" ];
        filesystems = [ "xdg-download/simplex:create" ];
      };
      "org.torproject.torbrowser-launcher".Context = {
        filesystems = [ "xdg-download/torbrowser:create" ];
      };
      "com.valvesoftware.Steam".Context = {
        sockets = [ "x11" "pulseaudio" ];
        filesystems = [ "~/games" ];
        features = [ "multiarch" "per-app-dev-shm" ];
      };
      "com.prusa3d.PrusaSlicer".Context = {
        sockets = [ "x11" ];
        filesystems = [ "~/Documents/3d" ];
      };
      "org.freecad.FreeCAD".Context = {
        filesystems = [ "~/Documents/3d" ];
      };
      "com.github.iwalton3.jellyfin-media-player".Context = {
        sockets = [ "pulseaudio" ];
      };
      "dev.vencord.Vesktop".Context = {
        sockets = [ "pulseaudio" ];
      };
      "org.audacityteam.Audacity".Context = {
        sockets = [ "pulseaudio" ];
        filesystems = [ "~/Music" ];
      };
      "us.zoom.Zoom" = {
        Context = {
          sockets = [ "x11" "pulseaudio" ];
        };
        "Session Bus Policy" = {
          "org.kde.*" = "none";
        };
      };
      "com.github.johnfactotum.Foliate".Environment = {
        GTK_THEME = "";
      };
      "com.google.AndroidStudio" = {
        Context = {
          sockets = [ "x11" ];
          persistent = [ "Android" ".android" ".gradle" ".java" ".dartServer" ".dart-tool" ".flutter" ".skiko" ".pub-cache" ];
          devices = [ "kvm" ];
          filesystems = [ "~/Documents/android" ];
        };
        Environment = {
          QT_QPA_PLATFORM="xcb"; # The AVD requires running in X11 for now
        };
      };
      "com.github.xournalpp.xournalpp".Context = {
        filesystems = [ "xdg-documents/xournal" ];
      };
      "org.mozilla.Thunderbird".Context = {
        sockets = [ "cups" ];
      };
      "com.obsproject.Studio".Context = {
        sockets = [ "pulseaudio" ];
      };
      "org.kde.kdenlive".Context = {
        sockets = [ "pulseaudio" ];
        filesystems = [ "xdg-videos" ];
      };
      "org.prismlauncher.PrismLauncher".Context = {
        sockets = [ "pulseaudio" ];
      };
      "at.vintagestory.VintageStory".Context = {
        sockets = [ "pulseaudio" ];
      };
      "org.localsend.localsend_app".Context = {
        filesystems = [ "xdg-download/localsend:create" ];
      };
      "io.itch.itch".Context = {
        sockets = [ "x11" "pulseaudio" ];
        persistent = [ ".wine" ".wine64" ];
      };
      "com.usebottles.bottles".Context = {
        sockets = [ "x11" "pulseaudio" ];
        features = [ "multiarch" ];
      };
      "com.github.IsmaelMartinez.teams_for_linux".Context = {
        sockets = [ "pulseaudio" ];
      };
      "io.github.ungoogled_software.ungoogled_chromium".Context = {
        sockets = [ "pulseaudio" ];
        filesystems = [ "xdg-download/chromium" ];
      };
      "org.signal.Signal".Context = {
        sockets = [ "pulseaudio" ];
        filesystems = [ "xdg-download/signal" ];
      };
    };
    uninstallUnmanaged = true;
    uninstallUnused = true;
    update.onActivation = true;
    update.auto = {
      enable = true;
      onCalendar = "daily";
    };
  };
}
