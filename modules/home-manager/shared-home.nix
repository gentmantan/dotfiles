{pkgs, ...}: let
  enableWithNushell = {
    enable = true;
    enableNushellIntegration = true;
  };
in {
  imports = [
    ./kitty.nix
    ./nushell.nix
    ./xdg.nix
    ./cursor.nix
  ];

  xdg.configFile."niri/config.kdl".source = ./niri-config.kdl;

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    nmap
    p7zip
    qrencode
    quickemu
    wl-screenrec
    xwayland-satellite
  ];

  programs = {
    home-manager.enable = true;
    imv.enable = true;
    mpv = {
      enable = true;
      scripts = [pkgs.mpvScripts.mpris pkgs.mpvScripts.vr-reversal];
    };
    yt-dlp.enable = true;
    zathura = {
      enable = true;
      extraConfig = ''
        set selection-clipboard clipboard
      '';
    };
    ripgrep.enable = true;

    neovim.defaultEditor = true;

    # Shell utilities
    carapace = enableWithNushell;
    yazi =
      enableWithNushell
      // {
        plugins = {
          "mount" = pkgs.yaziPlugins.mount;
        };
        keymap = {
          mgr.prepend_keymap = [
            {
              run = "plugin mount";
              on = ["M"];
              desc = "Open disk mount manager";
            }
          ];
        };
      };
    starship = enableWithNushell;
    zoxide = enableWithNushell;
  };
  services.playerctld.enable = true;
}
