{
  imports = [./shared-home.nix ./sftp-client.nix ./ssh-client.nix ./syncthing.nix ./git.nix];
  home.username = "tangy";
  customGit = {
    enable = true;
    email = "git@gtan.me";
    name = "Gentman Tan";
  };
}
