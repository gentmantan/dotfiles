{lib, ...}: {
  wayland.windowManager.niri = {
    enable = true;
    settings = {
      input = {
        keyboard = {
          xkb.options = "ctrl:nocaps";
          numlock = {};
        };
        touchpad = {
          tap = {};
          natural-scroll = {};
        };
        warp-mouse-to-focus = {};
        focus-follows-mouse = {};
      };
      layout = {
        gaps = 5;
        background-color = "transparent";
        center-focused-column = "never";
        preset-column-widths._children = [
          {proportion = 0.33333;}
          {proportion = 0.5;}
          {proportion = 0.66667;}
        ];
        focus-ring.width = 4;
      };
      hotkey-overlay.skip-at-startup = {};
      prefer-no-csd = {};
      screenshot-path = null;

      binds = {
        # dms / niri commands
        "Mod+Shift+Slash".spawn-sh = "dms ipc call keybinds toggle niri";

        # launchers
        "Mod+T" = {
          _props.hotkey-overlay-title = "Open a Terminal";
          spawn = ["kitty"];
        };
        "Mod+Return" = {
          _props.hotkey-overlay-title = "Open a Terminal";
          spawn = ["kitty"];
        };
        "Mod+Shift+D" = {
          _props.hotkey-overlay-title = "Run an Application";
          spawn-sh = "dms ipc call spotlight open";
        };
        "Mod+D" = {
          _props.hotkey-overlay-title = "Run an Application";
          spawn-sh = "dms ipc call spotlight open";
        };
        "Mod+X" = {
          _props.hotkey-overlay-title = "Open Power Menu";
          spawn-sh = "dms ipc call powermenu toggle";
        };
        "Mod+W" = {
          _props.hotkey-overlay-title = "Open Librewolf";
          spawn-sh = "flatpak run io.gitlab.librewolf-community";
        };
        "Mod+Shift+W" = {
          _props.hotkey-overlay-title = "Open Firefox";
          spawn-sh = "flatpak run org.mozilla.firefox";
        };
        "Mod+Shift+P" = {
          _props.hotkey-overlay-title = "Open KeePassXC";
          spawn-sh = "flatpak run org.keepassxc.KeePassXC";
        };
        "Mod+Ctrl+W" = {
          _props.hotkey-overlay-title = "Open Tor Browser";
          spawn-sh = "flatpak run org.torproject.torbrowser-launcher";
        };
        "Mod+Shift+T" = {
          _props.hotkey-overlay-title = "Open Thunderbird";
          spawn-sh = "flatpak run org.mozilla.thunderbird";
        };

        # audio
        "XF86AudioRaiseVolume" = {
          _props.allow-when-locked = true;
          spawn-sh = "dms ipc call audio increment 5";
        };
        "XF86AudioLowerVolume" = {
          _props.allow-when-locked = true;
          spawn-sh = "dms ipc call audio decrement 5";
        };
        "XF86AudioMute" = {
          _props.allow-when-locked = true;
          spawn-sh = "dms ipc call audio mute";
        };
        "XF86AudioMicMute" = {
          _props.allow-when-locked = true;
          spawn-sh = "dms ipc call audio micmute";
        };

        # media (mpris)
        "XF86AudioPlay" = {
          _props.allow-when-locked = true;
          spawn-sh = "dms ipc call mpris playPause";
        };
        "XF86AudioStop" = {
          _props.allow-when-locked = true;
          spawn-sh = "dms ipc call mpris stop";
        };
        "XF86AudioPrev" = {
          _props.allow-when-locked = true;
          spawn-sh = "dms ipc call mpris previous";
        };
        "XF86AudioNext" = {
          _props.allow-when-locked = true;
          spawn-sh = "dms ipc call mpris next";
        };

        # brightness
        "XF86MonBrightnessUp" = {
          _props.allow-when-locked = true;
          spawn-sh = "dms ipc call brightness increment 10 \"\"";
        };
        "XF86MonBrightnessDown" = {
          _props.allow-when-locked = true;
          spawn-sh = "dms ipc call brightness decrement 10 \"\"";
        };

        # misc
        "Mod+Escape" = {
          _props.repeat = false;
          toggle-overview = {};
        };
        "Mod+grave" = {
          _props.repeat = false;
          spawn-sh = "dms ipc call notepad toggle";
        };
        "Mod+Q" = {
          _props.repeat = false;
          close-window = {};
        };

        # output rotation (eDP-1)
        "Mod+Alt+H" = {
          _props.repeat = false;
          spawn-sh = "niri msg output eDP-1 transform 90";
        };
        "Mod+Alt+J" = {
          _props.repeat = false;
          spawn-sh = "niri msg output eDP-1 transform 180";
        };
        "Mod+Alt+K" = {
          _props.repeat = false;
          spawn-sh = "niri msg output eDP-1 transform normal";
        };
        "Mod+Alt+L" = {
          _props.repeat = false;
          spawn-sh = "niri msg output eDP-1 transform 270";
        };

        # focus
        "Mod+Left".focus-column-left = {};
        "Mod+Down".focus-window-down = {};
        "Mod+Up".focus-window-up = {};
        "Mod+Right".focus-column-right = {};
        "Mod+H".focus-column-left = {};
        "Mod+J".focus-window-or-workspace-down = {};
        "Mod+K".focus-window-or-workspace-up = {};
        "Mod+L".focus-column-right = {};

        # move window / column
        "Mod+Ctrl+Left".move-column-left = {};
        "Mod+Ctrl+Down".move-window-down = {};
        "Mod+Ctrl+Up".move-window-up = {};
        "Mod+Ctrl+Right".move-column-right = {};
        "Mod+Ctrl+H".move-column-left = {};
        "Mod+Ctrl+J".move-window-down-or-to-workspace-down = {};
        "Mod+Ctrl+K".move-window-up-or-to-workspace-up = {};
        "Mod+Ctrl+L".move-column-right = {};

        # first / last column
        "Mod+Home".focus-column-first = {};
        "Mod+End".focus-column-last = {};
        "Mod+Ctrl+Home".move-column-to-first = {};
        "Mod+Ctrl+End".move-column-to-last = {};

        # monitor focus
        "Mod+Shift+Left".focus-monitor-left = {};
        "Mod+Shift+Down".focus-monitor-down = {};
        "Mod+Shift+Up".focus-monitor-up = {};
        "Mod+Shift+Right".focus-monitor-right = {};
        "Mod+Shift+H".focus-monitor-left = {};
        "Mod+Shift+J".focus-monitor-down = {};
        "Mod+Shift+K".focus-monitor-up = {};
        "Mod+Shift+L".focus-monitor-right = {};

        # move column to monitor
        "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = {};
        "Mod+Shift+Ctrl+Down".move-column-to-monitor-down = {};
        "Mod+Shift+Ctrl+Up".move-column-to-monitor-up = {};
        "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = {};
        "Mod+Shift+Ctrl+H".move-column-to-monitor-left = {};
        "Mod+Shift+Ctrl+J".move-column-to-monitor-down = {};
        "Mod+Shift+Ctrl+K".move-column-to-monitor-up = {};
        "Mod+Shift+Ctrl+L".move-column-to-monitor-right = {};

        # workspaces: focus / move column
        "Mod+Page_Down".focus-workspace-down = {};
        "Mod+Page_Up".focus-workspace-up = {};
        "Mod+U".focus-workspace-down = {};
        "Mod+I".focus-workspace-up = {};
        "Mod+Ctrl+Page_Down".move-column-to-workspace-down = {};
        "Mod+Ctrl+Page_Up".move-column-to-workspace-up = {};
        "Mod+Ctrl+U".move-column-to-workspace-down = {};
        "Mod+Ctrl+I".move-column-to-workspace-up = {};

        # workspaces: move workspace
        "Mod+Shift+Page_Down".move-workspace-down = {};
        "Mod+Shift+Page_Up".move-workspace-up = {};
        "Mod+Shift+U".move-workspace-down = {};
        "Mod+Shift+I".move-workspace-up = {};

        # wheel scroll (vertical → workspaces)
        "Mod+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          focus-workspace-down = {};
        };
        "Mod+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          focus-workspace-up = {};
        };
        "Mod+Ctrl+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          move-column-to-workspace-down = {};
        };
        "Mod+Ctrl+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          move-column-to-workspace-up = {};
        };

        # wheel scroll (horizontal / shift → columns)
        "Mod+WheelScrollRight".focus-column-right = {};
        "Mod+WheelScrollLeft".focus-column-left = {};
        "Mod+Ctrl+WheelScrollRight".move-column-right = {};
        "Mod+Ctrl+WheelScrollLeft".move-column-left = {};
        "Mod+Shift+WheelScrollDown".focus-column-right = {};
        "Mod+Shift+WheelScrollUp".focus-column-left = {};
        "Mod+Ctrl+Shift+WheelScrollDown".move-column-right = {};
        "Mod+Ctrl+Shift+WheelScrollUp".move-column-left = {};

        # touchpad scroll → volume / brightness
        "Mod+TouchpadScrollUp".spawn-sh = "dms ipc call audio increment 2";
        "Mod+TouchpadScrollDown".spawn-sh = "dms ipc call audio decrement 2";
        "Mod+Shift+TouchpadScrollUp".spawn-sh = "dms ipc call brightness increment 2 \"\"";
        "Mod+Shift+TouchpadScrollDown".spawn-sh = "dms ipc call brightness decrement 2 \"\"";

        # workspaces 1–9
        "Mod+1".focus-workspace = 1;
        "Mod+2".focus-workspace = 2;
        "Mod+3".focus-workspace = 3;
        "Mod+4".focus-workspace = 4;
        "Mod+5".focus-workspace = 5;
        "Mod+6".focus-workspace = 6;
        "Mod+7".focus-workspace = 7;
        "Mod+8".focus-workspace = 8;
        "Mod+9".focus-workspace = 9;
        "Mod+Ctrl+1".move-column-to-workspace = 1;
        "Mod+Ctrl+2".move-column-to-workspace = 2;
        "Mod+Ctrl+3".move-column-to-workspace = 3;
        "Mod+Ctrl+4".move-column-to-workspace = 4;
        "Mod+Ctrl+5".move-column-to-workspace = 5;
        "Mod+Ctrl+6".move-column-to-workspace = 6;
        "Mod+Ctrl+7".move-column-to-workspace = 7;
        "Mod+Ctrl+8".move-column-to-workspace = 8;
        "Mod+Ctrl+9".move-column-to-workspace = 9;

        # column consumption / expulsion
        "Mod+BracketLeft".consume-or-expel-window-left = {};
        "Mod+BracketRight".consume-or-expel-window-right = {};
        "Mod+Comma".consume-window-into-column = {};
        "Mod+Period".expel-window-from-column = {};

        # sizing
        "Mod+R".switch-preset-column-width = {};
        "Mod+Shift+R".switch-preset-window-height = {};
        "Mod+Ctrl+R".reset-window-height = {};
        "Mod+F".maximize-column = {};
        "Mod+Shift+F".fullscreen-window = {};
        "Mod+Ctrl+F".expand-column-to-available-width = {};
        "Mod+C".center-column = {};
        "Mod+Ctrl+C".center-visible-columns = {};
        "Mod+Minus".set-column-width = "-10%";
        "Mod+Equal".set-column-width = "+10%";
        "Mod+Shift+Minus".set-window-height = "-10%";
        "Mod+Shift+Equal".set-window-height = "+10%";

        # floating / tabbed
        "Mod+V".toggle-window-floating = {};
        "Mod+Shift+V".switch-focus-between-floating-and-tiling = {};
        "Mod+E".toggle-column-tabbed-display = {};

        # screenshots
        "Print".screenshot = {};
        "Ctrl+Print".screenshot-screen = {};
        "Alt+Print".screenshot-window = {};

        # keyboard-shortcuts inhibitor
        "Mod+Shift+Escape" = {
          _props.allow-inhibiting = false;
          toggle-keyboard-shortcuts-inhibit = {};
        };

        # quit
        "Mod+Shift+E".quit = {};
        "Ctrl+Alt+Delete".quit = {};
      };

      _children = [
        {
          window-rule._children = [
            {match._props.app-id = "^org\\.keepassxc\\.KeePassXC$";}
            {block-out-from = "screen-capture";}
          ];
        }
      ];
    };
    checkConfig = false;
    extraConfig = lib.mkBefore ''
      include "dms/alttab.kdl"
      include "dms/binds.kdl"
      include "dms/colors.kdl"
      include "dms/cursor.kdl"
      include "dms/layout.kdl"
      include "dms/outputs.kdl"
      include "dms/windowrules.kdl"
      include "dms/wpblur.kdl"
    '';
  };
}
