{
  services.btrbk = {
    instances."home" = {
      onCalendar = "hourly";
      settings = {
        snapshot_preserve_min = "1w";
        snapshot_preserve = "2w";
        volume = {
          "/" = {
            snapshot_dir = "/snapshots";
            subvolume = "home";
          };
        };
      };
    };
  };
}
