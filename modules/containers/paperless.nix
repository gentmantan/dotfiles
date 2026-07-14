{config, ...}: {
  virtualisation.quadlet = let
    inherit (config.virtualisation.quadlet) pods;
  in {
    containers = {
      paperless_broker = {
        containerConfig = {
          image = "docker.io/library/redis:8";
          pull = "newer";
          autoUpdate = "registry";
          volumes = ["paperless-redis-data:/data"];
          pod = pods.paperless.ref;
        };
      };
      paperless_db = {
        containerConfig = {
          image = "docker.io/library/postgres:18";
          pull = "newer";
          autoUpdate = "registry";
          environmentFiles = ["/config/env/paperless.env"];
          pod = pods.paperless.ref;
        };
      };
      paperless_webserver = {
        containerConfig = {
          image = "ghcr.io/paperless-ngx/paperless-ngx:latest";
          pull = "newer";
          autoUpdate = "registry";
          pod = pods.paperless.ref;
          volumes = ["/nest0/paperless/data:/usr/src/paperless/data" "/nest0/paperless/media:/usr/src/paperless/media" "/nest0/paperless/export:/usr/src/paperless/export" "/nest0/paperless/consume:/usr/src/paperless/consume"];
          environmentFiles = ["/config/env/paperless.env"];
        };
      };
    };
    pods = {
      paperless = {
        podConfig = {
          publishPorts = ["127.0.0.1:36049:8000"];
        };
      };
    };
  };
}
