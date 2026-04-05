{
  virtualisation.oci-containers.containers = {
    caddy = {
      image = "docker.io/caddy";
      autoStart = true;
      volumes = [
        "/config/caddy/Caddyfile:/etc/caddy/Caddyfile:ro"
        "/config/caddy/site:/srv:ro"
        "/config/caddy/certs:/certs:ro"
        "caddy_data:/data"
        "caddy_config:/config"
      ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      extraOptions = [
        "--restart=on-failure"
        "--network=host" # Required for IPv6 networking
      ];
    };
  };
}
