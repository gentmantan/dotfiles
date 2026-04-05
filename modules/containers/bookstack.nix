{config, ...}: {
  virtualisation.quadlet = let
    inherit (config.virtualisation.quadlet) pods;
  in {
    containers = {
      bookstack_server = {
        containerConfig = {
          image = "lscr.io/linuxserver/bookstack";
          pull = "newer";
          autoUpdate = "registry";
          pod = pods.bookstack.ref;
          volumes = ["/config/bookstack/config:/config"];
          environmentFiles = ["/config/env/bookstack.env"];
        };
      };
      bookstack_db = {
        containerConfig = {
          image = "docker.io/mariadb:latest";
          pull = "newer";
          autoUpdate = "registry";
          pod = pods.bookstack.ref;
          volumes = ["/config/bookstack/db:/var/lib/mysql"];
          environmentFiles = ["/config/env/bookstack.env"];
        };
      };
    };
    pods = {
      bookstack = {
        podConfig = {
          publishPorts = ["127.0.0.1:29509:80"];
        };
      };
    };
  };
}
