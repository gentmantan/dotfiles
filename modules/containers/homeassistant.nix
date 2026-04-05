{config, ...}: {
  virtualisation.quadlet = let
    inherit (config.virtualisation.quadlet) pods;
  in {
    containers = {
      home_assistant_server = {
        containerConfig = {
          image = "ghcr.io/home-assistant/home-assistant:stable";
          pull = "newer";
          autoUpdate = "registry";
          pod = pods.home_assistant.ref;
          volumes = ["/config/homeassistant:/config" "/etc/localtime:/etc/localtime:ro"];
          devices = ["/dev/serial/by-id/usb-Silicon_Labs_HubZ_Smart_Home_Controller_C1300971-if01-port0:/dev/serial/by-id/usb-Silicon_Labs_HubZ_Smart_Home_Controller_C1300971-if01-port0"];
        };
      };
      zwave_js = {
        containerConfig = {
          image = "docker.io/zwavejs/zwave-js-ui";
          pull = "newer";
          autoUpdate = "registry";
          pod = pods.home_assistant.ref;
          volumes = ["/config/zwave-js:/usr/src/app/store"];
          devices = ["/dev/serial/by-id/usb-Silicon_Labs_HubZ_Smart_Home_Controller_C1300971-if00-port0:/dev/serial/by-id/usb-Silicon_Labs_HubZ_Smart_Home_Controller_C1300971-if00-port0"];
          environments = {TRUST_PROXY = "true";};
        };
      };
    };
    pods = {
      home_assistant = {
        podConfig = {
          publishPorts = ["127.0.0.1:26920:8123" "127.0.0.1:14509:8091"];
        };
      };
    };
  };
}
