{
  virtualisation.oci-containers.containers = {
    iperf3 = {
      image = "docker.io/networkstatic/iperf3";
      autoStart = true;
      ports = [ "15555:5201" ];
      pull = "newer";
      extraOptions = [ "-it" "--restart=on-failure" ];
      cmd = [ "-s" ];
    };
  };
}
