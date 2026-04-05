{config, ...}: {
  virtualisation.quadlet = let
    inherit (config.virtualisation.quadlet) pods;
  in {
    containers = {
      llama_cpp = {
        containerConfig = {
          image = "ghcr.io/ggml-org/llama.cpp:server-vulkan";
          pull = "newer";
          autoUpdate = "registry";
          pod = pods.ai.ref;
          volumes = ["/nest0/models:/nest0/models"];
          environmentFiles = ["/config/env/llamacpp.env"];
          devices = ["/dev/dri/renderD128" "/dev/dri/renderD129"];
        };
      };
      sillytavern = {
        containerConfig = {
          image = "ghcr.io/sillytavern/sillytavern";
          pull = "newer";
          autoUpdate = "registry";
          pod = pods.ai.ref;
          volumes = ["/config/sillytavern/config:/home/node/app/config" "/config/sillytavern/data:/home/node/app/data" "/config/sillytavern/plugins:/home/node/app/plugins"];
          environments = {TZ = "America/New_York";};
        };
      };
    };
    pods = {
      ai = {
        podConfig = {
          publishPorts = ["127.0.0.1:26653:8080" "127.0.0.1:30799:8000"];
        };
      };
    };
  };
}
