{
  imports = [./shared-home.nix ./sftp-client.nix ./ssh-client.nix ./git.nix];
  home.username = "tangy";
  customGit = {
    enable = true;
    email = "gentmantan@gmail.com";
    name = "Gentman Tan";
  };
  services.syncthing = {
    enable = true;
    extraOptions = [
      "--gui-address=127.0.0.1:8384"
    ];
  };
}
