{
  virtualisation.oci-containers.containers = {
    jdownloader = {
      image = "docker.io/jlesage/jdownloader-2";
      autoStart = true;
      ports = [ "8085:5800" ];
      volumes = [ 
        "/config/jdownloader:/config"
        "/nest0/jdownloads:/output"
      ];
      pull = "newer";
      extraOptions = [ "--restart=on-failure" ];
      environment = {
        UMASK="027";
        USER_ID="0";
        GROUP_ID="0";
        SECURE_CONNECTION="1";
        WEB_AUTHENTICATION="1";
        WEB_AUTHENTICATION_USERNAME="user";
        WEB_AUTHENTICATION_PASSWORD="dM2wRW1V6QlD5dSS"; # TODO: Use agenix for secrets
      };
    };
  };
}
