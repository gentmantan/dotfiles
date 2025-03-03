{
  virtualisation.oci-containers.containers = {
    jdownloader = {
      image = "docker.io/jlesage/jdownloader-2";
      autoStart = true;
      ports = [ "127.0.0.1:8085:5800" ];
      volumes = [ 
        "/config/jdownloader:/config"
        "/nest0/jdownloads:/output"
      ];
      pull = "newer";
      extraOptions = [ "--restart=on-failure" ];
      environmentFiles = [
        /config/env/jdownloader.env
      ];
    };
  };
}
