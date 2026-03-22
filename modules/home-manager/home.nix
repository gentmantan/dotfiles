{
  imports = [./shared-home.nix ./sftp-client.nix ./ssh-client.nix ./git.nix];
  home.username = "tangy";
  customGit = {
    enable = true;
    email = "gentmantan@gmail.com";
    name = "Gentman Tan";
  };
}
