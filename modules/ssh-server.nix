{
  services.openssh = {
    enable = true;
    ports = [ 48316 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "prohibit-password";
      KbdInteractiveAuthentication = false;
    };
  };
  users.users.root = {
    openssh.authorizedKeys.keyFiles = [ ../.ssh/clipper.pub ];
  };
}
