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

  specialisation = {
    passthrough.configuration = {
      virtualisation.libvirtd.qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
      boot.initrd.kernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"
        "radeon"
      ];
      boot.kernelParams = [
        "amd_iommu=on"
        "vfio-pci.ids=1002:73df,1002:ab28"
      ];
    };
  };
}
