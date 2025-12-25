{
  lib,
  config,
  ...
}: let
  cfg = config.customGit;
in
  with lib; {
    options.customGit = {
      enable = mkEnableOption "Enable Git config Home Manager";
      email = mkOption {
        type = types.str;
        default = "";
        example = "foobar@example.com";
        description = "Email of git user";
      };
      name = mkOption {
        type = types.str;
        default = "";
        example = "Jane Doe";
        description = "Name of git user";
      };
    };
    config = mkIf cfg.enable {
      programs.git = {
        enable = true;
        lfs.enable = true;
        settings.user = {
          email = "${cfg.email}";
          name = "${cfg.name}";
        };
      };
      programs.gh = {
        enable = true;
      };
    };
  }
