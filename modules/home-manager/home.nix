{
  imports = [./shared-home.nix ./sftp-client.nix ./ssh-client.nix];
  home.username = "tangy";
  programs.git = {
    # FIXME: Use your own git credentials!
    enable = true;
    lfs.enable = true;
    settings.user = {
      email = "gentmantan@gmail.com";
      name = "Gentman Tan";
    };
  };
  programs.gh = {
    enable = true;
  };
  services.syncthing = {
    enable = true;
    extraOptions = [
      "--gui-address=127.0.0.1:8384"
    ];
  };
}
