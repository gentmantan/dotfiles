{
  virtualisation.oci-containers.containers = {
    caddy = {
      image = "docker.io/caddy";
      autoStart = true;
      volumes = [
        "/config/caddy/Caddyfile:/etc/caddy/Caddyfile:ro"
        "/config/caddy/site:/srv"
        "caddy_data:/data"
        "caddy_config:/config"
        "/config/games/terraria2/world/The_Buahsterlands.wld:/technophile/terraria/The_Buahsterlands.wld:ro"
        "/config/games/terraria/world/Tarraria.wld:/technophile/terraria/Tarraria.wld:ro"
        "/config/games/terraria3/tModLoader/Worlds:/technophile/terraria/The_Buasterlands_2:ro"
        "/config/games/factorio/saves:/technophile/factorio:ro"
        "/config/games/factorio2/saves:/technophile/factorio2:ro"
        "/config/games/corekeeper:/technophile/core-keeper:ro"
        "/config/games/dst:/technophile/dont-starve-together:ro"
        "/config/games/valheim-server/data:/technophile/valheim-server:ro"
        "/config/games/zomboid/config/Saves:/technophile/zomboid:ro"
        "/config/games/zomboid2/config/Saves:/technophile/zomboid2:ro"
        "/config/games/necesse:/technophile/necesse:ro"
        "/config/games/palworld/Pal/Saved/SaveGames:/technophile/palworld:ro"
      ];
      pull = "newer";
      extraOptions = [ 
        "--restart=unless-stopped"
        "--network=host" # Required for IPv6 networking
      ];
    };
  };
}
