{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
        modules-center = [ "mpris" ];
        modules-right = [ "backlight" "privacy" "bluetooth" "wireplumber" "network" "disk" "load" "memory" "battery" "temperature" "tray" "clock" ];
        fixed-center = false;

        "hyprland/workspaces" = {
          all-outputs = true;
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };
        "wireplumber" = {
          "format" = "{icon} {volume}%";
          "format-muted" = "󰝟";
          "on-click" = "set-mute @DEFAULT_SINK@ toggle";
          "max-volume" = 150;
          "scroll-step" = 0.2;
          format-icons = [ "󰕿" "󰖀" "󰕾" ];
        };
        disk = {
          format = " {specific_free:0.0f}GB";
          unit = "GB";
        };
        "mpris" = {
          "format" = "{player_icon} {title}";
          "format-paused" = "{status_icon} <i>{title}</i>";
          "player-icons" = {
            "default" = "";
            "mpv" = "";
            "freetube" = "";
            "firefox" = "󰈹";
          };
          "status-icons" = {
            "paused" = "";
          };
          "ignored-players" = [ "firefox" ];
          "title-len" = 60;
        };

        bluetooth = {
          "format" = "󰂯";
          "format-disabled" = "󰂲";
          "format-off" = "󰂲";
          "format-connected" = "󰂱 {device_battery_percentage}";
          "on-click" = "bluetoothctl show | grep -q 'Powered: yes' && bluetoothctl power off || bluetoothctl power on";
        };
        "clock" = {
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "format" = " {:%H:%M %m/%d/%Y}";
        };
        "calendar" = {
          "mode" = "year";
          "mode-mon-col" = 3;
          "weeks-pos" = "right";
          "on-scroll" = 1;
          "format" = {
            "months" = "<span color='#ffead3'><b>{}</b></span>";
            "days" = "<span color='#ecc6d9'><b>{}</b></span>";
            "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
            "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
            "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
          };
        };
        "actions" =  {
          "on-click-right" = "mode";
          "on-click-forward" = "tz_up";
          "on-click-backward" = "tz_down";
          "on-scroll-up" = "shift_up";
          "on-scroll-down" = "shift_down";
        };
        "backlight" = {
          "device" = "intel_backlight";
          "format" = "{icon}";
          "format-icons" = ["" "" "" "" "" "" "" "" ""];
        };
        "battery" = {
          "states" = {
              "warning" = 30;
              "critical" = 15;
          };
          "format-icons" = [ "󰁺" "󰁻"  "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          "format" = "{icon} {capacity}%";
         # "format-charging" = " {capacity}%";
         # "format-plugged" = " {capacity}%";
          "format-alt" = "{time}";
        };
        "network" = {
          "format" = "{ifname}";
          "format-wifi" = "{icon} {signalStrength}%";
          "format-ethernet" = "󰈀";
          "format-icons" = [ "󰤟" "󰤢" "󰤥" "󰤨" ];
          "tooltip-format" = "󰈀 {ifname} via {gwaddr}";
          "tooltip-format-wifi" = " {essid} {ipaddr}/{cidr} {signalStrength}% {frequency} {bandwidthUpBits} {bandwidthDownBits}";
          "tooltip-format-ethernet" = "󰈀 {ifname} {ipaddr}/{cidr} via {gwaddr}";
          "tooltip-format-disconnected" = "Disconnected";
          "max-length" = 25;
        };
        "temperature" = {
          "critical-threshold" = 80;
          "format" = "";
          "format-critical" = " {temperatureC}󰔄";
        };
      };
    };
    style = ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;
      * {
        font-family: Fira Code;
        font-size: 17px;
        min-height: 0;
      }
      
      #waybar {
        background: transparent;
        color: @text;
        margin: 5px 5px;
      }
      
      #workspaces {
        border-radius: 1rem;
        margin: 5px;
        background-color: @surface0;
        margin-left: 1rem;
      }
      
      #workspaces button {
        color: @lavender;
        border-radius: 1rem;
        padding: 0.4rem;
      }
      
      #workspaces button.active {
        color: @sky;
        border-radius: 1rem;
      }
      
      #workspaces button:hover {
        color: @sapphire;
        border-radius: 1rem;
      }
      
      #custom-music,
      #bluetooth,
      #backlight,
      #privacy,
      #network,
      #wireplumber,
      #disk,
      #load,
      #memory,
      #battery,
      #tray,
      #temperature,
      #clock {
        background-color: @surface0;
        padding: 0.5rem 1rem;
        margin: 5px 0;
      }
      
      #clock {
        color: @blue;
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }
      
      #battery.charging {
        color: @green;
      }
      
      #battery.warning:not(.charging) {
        color: @yellow;
      }

      #battery.critical:not(.charging) {
        color: @red;
      }
      
      #backlight {
        color: @yellow;
        margin-left: 1rem;
        border-radius: 1rem 0px 0px 1rem;
      }

      #bluetooth.off {
        color: @red;
      }

      #bluetooth.connected {
        color: @green;
      }
      
      #wireplumber.muted {
        color: @maroon;
      }
      
      #custom-music {
        color: @mauve;
        border-radius: 1rem;
      }
      
      #custom-lock {
          border-radius: 1rem 0px 0px 1rem;
          color: @lavender;
      }
      
      #custom-power {
          margin-right: 1rem;
          border-radius: 0px 1rem 1rem 0px;
          color: @red;
      }
      #tray {
          border-radius: 0px 0px 0px 0px
      }

      #temperature.critical {
        color: @red;
      }
    '';
  };
}
