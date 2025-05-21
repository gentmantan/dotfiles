# Auto-generated using compose2nix v0.3.1.
{ pkgs, lib, ... }:

{
  # Runtime
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    dockerCompat = true;
    defaultNetwork.settings = {
      # Required for container networking to be able to use names.
      dns_enabled = true;
    };
  };

  # Enable container name DNS for non-default Podman networks.
  # https://github.com/NixOS/nixpkgs/issues/226365
  networking.firewall.interfaces."podman+".allowedUDPPorts = [ 53 ];

  virtualisation.oci-containers.backend = "podman";

  # Containers
  virtualisation.oci-containers.containers."immich_machine_learning" = {
    image = "ghcr.io/immich-app/immich-machine-learning:release";
    environmentFiles = [ /config/env/immich.env ];
    volumes = [
      "immich_model-cache:/cache:rw"
    ];
    labels = {
      "io.containers.autoupdate" = "registry";
    };
    log-driver = "journald";
    extraOptions = [
      "--network-alias=immich-machine-learning"
      "--network=immich_default"
    ];
  };
  systemd.services."podman-immich_machine_learning" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-immich_default.service"
      "podman-volume-immich_model-cache.service"
    ];
    requires = [
      "podman-network-immich_default.service"
      "podman-volume-immich_model-cache.service"
    ];
    partOf = [
      "podman-compose-immich-root.target"
    ];
    wantedBy = [
      "podman-compose-immich-root.target"
    ];
  };
  virtualisation.oci-containers.containers."immich_postgres" = {
    image = "ghcr.io/immich-app/postgres:14-vectorchord0.3.0-pgvectors0.2.0";
    environmentFiles = [ /config/env/immich.env ];
    volumes = [
      "/nest0/immich/database:/var/lib/postgresql/data:rw"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=database"
      "--network=immich_default"
    ];
  };
  systemd.services."podman-immich_postgres" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-immich_default.service"
    ];
    requires = [
      "podman-network-immich_default.service"
    ];
    partOf = [
      "podman-compose-immich-root.target"
    ];
    wantedBy = [
      "podman-compose-immich-root.target"
    ];
  };
  virtualisation.oci-containers.containers."immich_redis" = {
    image = "docker.io/redis:6.2-alpine@sha256:905c4ee67b8e0aa955331960d2aa745781e6bd89afc44a8584bfd13bc890f0ae";
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=redis-cli ping || exit 1"
      "--network-alias=redis"
      "--network=immich_default"
    ];
  };
  systemd.services."podman-immich_redis" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-immich_default.service"
    ];
    requires = [
      "podman-network-immich_default.service"
    ];
    partOf = [
      "podman-compose-immich-root.target"
    ];
    wantedBy = [
      "podman-compose-immich-root.target"
    ];
  };
  virtualisation.oci-containers.containers."immich_server" = {
    image = "ghcr.io/immich-app/immich-server:release";
    environmentFiles = [ /config/env/immich.env ];
    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "/nest0/immich/upload:/usr/src/app/upload:rw"
      "/nest0/immich/import:/mnt/media/import:ro"
    ];
    labels = {
      "io.containers.autoupdate" = "registry";
    };
    ports = [
      "127.0.0.1:17770:2283/tcp"
    ];
    dependsOn = [
      "immich_postgres"
      "immich_redis"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=immich-server"
      "--network=immich_default"
    ];
  };
  systemd.services."podman-immich_server" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-immich_default.service"
    ];
    requires = [
      "podman-network-immich_default.service"
    ];
    partOf = [
      "podman-compose-immich-root.target"
    ];
    wantedBy = [
      "podman-compose-immich-root.target"
    ];
  };

  # Networks
  systemd.services."podman-network-immich_default" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "podman network rm -f immich_default";
    };
    script = ''
      podman network inspect immich_default || podman network create immich_default
    '';
    partOf = [ "podman-compose-immich-root.target" ];
    wantedBy = [ "podman-compose-immich-root.target" ];
  };

  # Volumes
  systemd.services."podman-volume-immich_model-cache" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect immich_model-cache || podman volume create immich_model-cache
    '';
    partOf = [ "podman-compose-immich-root.target" ];
    wantedBy = [ "podman-compose-immich-root.target" ];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-immich-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
