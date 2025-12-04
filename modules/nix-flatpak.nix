{
  services.flatpak = {
    # FIXME: Edit this list with your favorite apps!
    # Note that the first installation may take long with too many apps
    packages = [
      "com.bambulab.BambuStudio"
      "com.bitwarden.desktop"
      "com.github.IsmaelMartinez.teams_for_linux"
      "com.github.iwalton3.jellyfin-media-player"
      "com.google.AndroidStudio"
      "com.prusa3d.PrusaSlicer"
      "com.rustdesk.RustDesk"
      "com.usebottles.bottles"
      "com.valvesoftware.Steam"
      "dev.vencord.Vesktop"
      "io.freetubeapp.FreeTube"
      "io.github.ungoogled_software.ungoogled_chromium"
      "io.gitlab.librewolf-community"
      "net.ankiweb.Anki"
      "org.audacityteam.Audacity"
      "org.freecad.FreeCAD"
      "org.getmonero.Monero"
      "org.gimp.GIMP"
      "org.inkscape.Inkscape"
      "org.kde.kdenlive"
      "org.keepassxc.KeePassXC"
      "org.libreoffice.LibreOffice"
      "org.localsend.localsend_app"
      "org.mozilla.Thunderbird"
      "org.mozilla.firefox"
      "org.openscad.OpenSCAD"
      "org.signal.Signal"
      "org.torproject.torbrowser-launcher"
    ];
    overrides = {
      global = {
        # Permissions are set to be quite restrictive by default. I prefer to customize them on a per app basis
        # Refer to `man flatpak-override` for options
        Context = {
          devices = ["dri" "!shm" "!kvm" "!all" "!usb" "!input"];
          features = ["!devel" "!multiarch" "!bluetooth" "!canbus" "!per-app-dev-shm"];
          filesystems = ["!host:reset"];
          shared = ["!ipc"];
          sockets = ["wayland" "!x11" "!fallback-x11" "!pulseaudio" "!session-bus" "!system-bus" "!pcsc" "!cups" "!ssh-auth" "!gpg-agent"];
        };
        Environment = {
          ELECTRON_OZONE_PLATFORM_HINT = "auto";
          GTK_THEME = "Adwaita:dark";
          QT_QPA_PLATFORM = "wayland";
        };
        "System Bus Policy" = {
          "org.freedesktop.UDisks2" = "none";
          "org.freedesktop.UPower" = "none";
        };
        "Session Bus Policy" = {
          # Deny some known sandbox escape permissions
          "org.freedesktop.Flatpak" = "none";
          "org.freedesktop.impl.portal.PermissionStore" = "none";
          "org.freedesktop.secrets" = "none";
        };
      };
      "com.bambulab.BambuStudio".Context = {
        sockets = ["x11"];
        filesystems = ["xdg-documents/3d"];
      };
      "com.github.IsmaelMartinez.teams_for_linux".Context = {
        sockets = ["pulseaudio"];
      };
      "com.github.iwalton3.jellyfin-media-player".Context = {
        sockets = ["pulseaudio"];
      };
      "com.google.AndroidStudio" = {
        Context = {
          devices = ["kvm"];
          filesystems = ["xdg-documents/android"];
          persistent = ["Android" ".android" ".gradle" ".java" ".dartServer" ".dart-tool" ".flutter" ".skiko" ".pub-cache"];
          sockets = ["x11"];
        };
        Environment = {
          QT_QPA_PLATFORM = "xcb"; # The AVD requires running in X11 for now
        };
      };
      "com.prusa3d.PrusaSlicer".Context = {
        sockets = ["x11"];
        filesystems = ["xdg-documents/3d"];
      };
      "com.usebottles.bottles".Context = {
        features = ["multiarch"];
        filesystems = ["~/games"];
        sockets = ["x11" "pulseaudio"];
      };
      "com.valvesoftware.Steam".Context = {
        features = ["multiarch" "per-app-dev-shm"];
        filesystems = ["~/games"];
        sockets = ["x11" "pulseaudio"];
      };
      "dev.vencord.Vesktop".Context = {
        sockets = ["pulseaudio"];
      };
      "io.freetubeapp.FreeTube".Context = {
        sockets = ["pulseaudio"];
      };
      "io.github.ungoogled_software.ungoogled_chromium".Context = {
        filesystems = ["xdg-download/chromium:create"];
        sockets = ["pulseaudio"];
      };
      "io.gitlab.librewolf-community".Context = {
        filesystems = ["xdg-download/librewolf:create"];
        sockets = ["pulseaudio"];
      };
      "org.audacityteam.Audacity".Context = {
        filesystems = ["xdg-music"];
        sockets = ["pulseaudio"];
      };
      "org.freecad.FreeCAD".Context = {
        filesystems = ["xdg-documents/3d"];
      };
      "org.getmonero.Monero".Context = {
        filesystems = ["~/Monero:create"];
      };
      "org.gimp.GIMP".Context = {
        filesystems = ["xdg-pictures"];
      };
      "org.inkscape.Inkscape".Context = {
        filesystems = ["xdg-pictures"];
      };
      "org.kde.kdenlive".Context = {
        filesystems = ["xdg-videos"];
        sockets = ["pulseaudio"];
      };
      "org.keepassxc.KeePassXC".Context = {
        filesystems = ["~/KPass" "~/.keyfiles:ro"];
        shared = ["!network"];
      };
      "org.localsend.localsend_app".Context = {
        filesystems = ["xdg-download/localsend:create"];
      };
      "org.mozilla.Thunderbird".Context = {
        filesystems = ["xdg-download/thunderbird:create"];
      };
      "org.mozilla.firefox".Context = {
        filesystems = ["xdg-download/firefox:create"];
        sockets = ["pulseaudio"];
      };
      "org.openscad.OpenSCAD".Context = {
        filesystems = ["xdg-documents/3d"];
      };
      "org.signal.Signal".Context = {
        filesystems = ["xdg-download/signal:create"];
        sockets = ["pulseaudio"];
      };
      "org.torproject.torbrowser-launcher".Context = {
        filesystems = ["xdg-download/torbrowser:create"];
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
