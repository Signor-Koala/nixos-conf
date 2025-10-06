{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["yeff"];
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.vhostUserPackages = with pkgs; [virtiofsd];
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.docker = {
    enable = true;
  };
  users.users.yeff.extraGroups = ["docker"];
}
