{config, ...}: {
  virtualisation.quadlet = let
    inherit (config.virtualisation.quadlet) pods;
  in {
    containers = {
      immich_server = {
        containerConfig = {
          image = "ghcr.io/immich-app/immich-server:release";
          pull = "newer";
          autoUpdate = "registry";
          pod = pods.immich.ref;
          volumes = ["/etc/localtime:/etc/localtime:ro" "/nest0/immich/upload:/usr/src/app/upload" "/nest0/immich/import:/mnt/media/import:ro"];
          environmentFiles = ["/config/env/immich.env"];
        };
      };
      immich_machine_learning = {
        containerConfig = {
          image = "ghcr.io/immich-app/immich-machine-learning:release";
          pull = "newer";
          autoUpdate = "registry";
          pod = pods.immich.ref;
          volumes = ["immich-model-cache:/cache"];
          environmentFiles = ["/config/env/immich.env"];
        };
      };
      immich_redis = {
        containerConfig = {
          image = "docker.io/valkey/valkey:9@sha256:3eeb09785cd61ec8e3be35f8804c8892080f3ca21934d628abc24ee4ed1698f6";
          pull = "newer";
          autoUpdate = "registry";
          pod = pods.immich.ref;
          healthCmd = "redis-cli ping || exit 1";
        };
      };
      immich_postgres = {
        containerConfig = {
          image = "ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0@sha256:bcf63357191b76a916ae5eb93464d65c07511da41e3bf7a8416db519b40b1c23";
          pull = "newer";
          autoUpdate = "registry";
          pod = pods.immich.ref;
          volumes = ["/nest0/immich/database:/var/lib/postgresql/data"];
          environmentFiles = ["/config/env/immich.env"];
          shmSize = "128mb";
        };
      };
    };
    pods = {
      immich = {
        podConfig = {
          publishPorts = ["127.0.0.1:17770:2283"];
        };
      };
    };
  };
}
