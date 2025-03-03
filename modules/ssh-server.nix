{
  services.openssh = {
    enable = true;
    ports = [ 48316 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "prohibit-password";
    };
  };
}
