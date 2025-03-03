{
  virtualisation.oci-containers.containers = {
    privatebin = {
      image = "ghcr.io/privatebin/nginx-fpm-alpine";
      autoStart = true;
      ports = [ "127.0.0.1:58622:8080" ];
      volumes = [ 
        "/config/privatebin/conf.php:/srv/cfg/conf.php:ro"
        "/config/privatebin/php.ini:/etc/php/conf.d/00-docker.ini:ro"
        "/config/privatebin/nginx.conf:/etc/nginx/nginx.conf:ro"
        "/nest0/privatebin:/srv/data"
      ];
      pull = "newer";
      extraOptions = [ "--read-only" ];
    };
  };
}
