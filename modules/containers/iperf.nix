{
  virtualisation.oci-containers.containers = {
    iperf3 = {
      image = "docker.io/networkstatic/iperf3";
      autoStart = true;
      ports = [ "15555:5201" ];
      labels = {
        "io.containers.autoupdate" = "registry";
      };
      pull = "newer";
      cmd = [ "-s" ];
      extraOptions = [ "-it" ];
    };
  };
}
