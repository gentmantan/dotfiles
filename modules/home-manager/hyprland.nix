{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$privatebrowser" = "flatpak run io.gitlab.librewolf-community";
      "$normalbrowser" = "flatpak run org.mozilla.firefox";
      "$torbrowser" = "flatpak run org.torproject.torbrowser-launcher";
      "$email" = "flatpak run org.mozilla.Thunderbird";
      "$mainMod" = "SUPER";
      "$menu" = "bemenu-run --fn Fira Code";
      "$terminal" = "kitty";
      "$pass" = "flatpak run org.keepassxc.KeePassXC";

      monitor = [
        "eDP-1,preferred,auto,1.333"
        "desc:GIGA-BYTE TECHNOLOGY CO. LTD. Gigabyte M32U,3840x2160@144,auto,1"
      ];
      exec-once="waybar";

      general = {
        allow_tearing=false;
        border_size=2;
        "col.active_border"="rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border"="rgba(595959aa)";
        gaps_in=5;
        gaps_out=20;
        layout="dwindle";
        resize_on_border=true;
      };
      animations = {
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
        enabled = true;
      };
      decoration = {
        rounding = 10;
        active_opacity=1.0;
        inactive_opacity=1.0;
        shadow = {
          range=4;
          render_power=3;
        };
        blur = {
          enabled="true";
          passes="1";
          size="3";
          vibrancy="0.169600";
        };
      };
      dwindle = {
        preserve_split=true;
        pseudotile=true;
      };
      master = {
        new_status="master";
      };
      input = {
        touchpad = {
          disable_while_typing=false;
          natural_scroll=true;
        };
        follow_mouse=1;
        kb_options="ctrl:nocaps";
        sensitivity=0;
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      };
      misc = {
        vrr = 1;
      };
      env = [
        "HYPRCURSOR_SIZE=32"
        "BEMENU_BACKEND,wayland"
      ];

      bindl = [ # Bindings work even when locked
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86Tools, exec, playerctl play-pause"
        ", XF86Favorites, exec, playerctl next"
        ", XF86Keyboard, exec, playerctl previous"
        ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl set --min-value=1 10%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_SINK@ 5%+ && wpctl set-mute @DEFAULT_SINK@ off"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%- &&  wpctl set-mute @DEFAULT_SINK@ off"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"
      ];

      bind = [ 
        "$mainMod, Return, exec, $terminal"
        "$mainMod, T, exec, $terminal"
        "$mainMod, W, exec, $privatebrowser"
        "$mainMod SHIFT, W, exec, $normalbrowser"
        "$mainMod CTRL, W, exec, $torbrowser"
        "$mainMod SHIFT, T, exec, $email"
        "$mainMod SHIFT, P, exec, $pass"
        "$mainMod, Q, killactive"
        "$mainMod SHIFT, E, exit"
        "$mainMod SHIFT, Space, togglefloating"
        "$mainMod SHIFT, D, exec, $menu"
        "$mainMod, F, fullscreen, 1"
        "$mainMod, E, togglegroup"
        "$mainMod, S, changegroupactive"
        "$mainMod SHIFT, minus, movetoworkspacesilent, special"
        "$mainMod, minus, togglespecialworkspace, special"
        ", Print, exec, slurp | grim -g - - | wl-copy"
        "$mainMod, [, exec, curr=$(hyprctl getoption general:gaps_out | grep -o '[-][0-9]+|[0-9]+' | head -n 1) && hyprctl keyword general:gaps_out $(($curr <= 20 ? 20 : $curr - 50))"
        "$mainMod, ], exec, curr=$(hyprctl getoption general:gaps_out | grep -o '[-][0-9]+|[0-9]+' | head -n 1) && hyprctl keyword general:gaps_out $(($curr >= 220 ? 220 : $curr + 50))"
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 1, workspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 2, workspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 3, workspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 4, workspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 5, workspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 6, workspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 7, workspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 8, workspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 9, workspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod SHIFT, 0, workspace, 10"
        "$mainMod SHIFT, h, movewindoworgroup, l"
        "$mainMod SHIFT, j, movewindoworgroup, d"
        "$mainMod SHIFT, k, movewindoworgroup, u"
        "$mainMod SHIFT, l, movewindoworgroup, r"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod&Alt_L, k, exec, hyprctl keyword monitor eDP-1,preferred,auto,1.333,transform,0"
        "$mainMod&Alt_L, h, exec, hyprctl keyword monitor eDP-1,preferred,auto,1.333,transform,1"
        "$mainMod&Alt_L, j, exec, hyprctl keyword monitor eDP-1,preferred,auto,1.333,transform,2"
        "$mainMod&Alt_L, l, exec, hyprctl keyword monitor eDP-1,preferred,auto,1.333,transform,3"
      ];
      bindm = [ 
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    }; # Settings block
    extraConfig = ''
      bind=$mainMod,R,submap,resize
      submap=resize
      binde=,l,resizeactive,150 0
      binde=,h,resizeactive,-150 0
      binde=,k,resizeactive,0 -150
      binde=,j,resizeactive,0 150
      bind=,escape,submap,reset 
      submap=reset
      
      $mode-system = (k) lock | (e) exit | (s) poweroff | (r) reboot
      bind = $mainMod, x, submap, $mode-system
      submap = $mode-system
      bind = , k, exec, hyprlock --immediate
      bindl = , k, submap, reset
      bind = , e, exit
      bind = , r, exec, systemctl reboot
      bind = , s, exec, systemctl poweroff
      bind = , escape, submap, reset
      submap = reset

      bind = $mainMod,Escape,submap,passthru
      submap = passthru
      bind = $mainMod,Escape,submap,reset
      submap = reset
    '';
  }; # Using extraConfig because submap is not able to be defined multiple times
}
