{
  virtualisation.oci-containers.containers = {
    koboldcpp = {
      image = "docker.io/koboldai/koboldcpp";
      autoStart = true;
      ports = [ "127.0.0.1:26653:5001" ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      environmentFiles = [ "/config/env/koboldcpp.env" ];
      extraOptions = [ "--device=/dev/dri/renderD128" ];
    };
  };
}
