{
  virtualisation.oci-containers.containers = {
    samba = {
      image = "ghcr.io/crazy-max/samba:latest";
      autoStart = true;
      ports = [ "445:445" ];
      volumes = [ 
        "/config/samba/samba-config.yml:/data/config.yml:ro"
        "/nest0/sharedfolders/takoputer:/samba/takoputer"
        "/nest0/sharedfolders/scans:/samba/scans"
        "/nest0/sharedfolders/takoputergames:/samba/takoputer/takoputergames:ro"
      ];
      pull = "newer";
      environment = {
        TZ="US/Eastern";
        SAMBA_HOSTS_ALLOW="0.0.0.0/0";
        SAMBA_FOLLOW_SYMLINKS="no";
        SAMBA_WIDE_LINKS="no";
      };
    };
  };
}
