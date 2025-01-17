{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "tangy" ];
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
    libvirtd.qemu.swtpm.enable = true;
  };
}
