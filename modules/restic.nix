let
  backup-paths = [ "/nest0/immich" "/nest0/syncthing" "/config/bookstack" "/config/env/bookstack.env" "/config/immich" "/config/games" ];
  keyfile = "/config/restic/backup.key";
in
{
  services.restic = {
    backups = {
      local-backup = {
        initialize = true;
        passwordFile = keyfile;
        paths = backup-paths; 
        repository = "/nest1";
      };
      remote-backup = {
        initialize = true;
        environmentFile = "/config/restic/restic.env";
        passwordFile = keyfile;
        paths = backup-paths; 
        repository = "s3:https://s3.us-east-005.backblazeb2.com/nest0-backup";
      };
    };
  };
}
