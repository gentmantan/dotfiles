{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "tangy" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
