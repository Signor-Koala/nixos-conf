{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.yubikey-personalization];
  services.udev.packages = [pkgs.yubikey-personalization];

  services.pcscd.enable = true;
  programs.ssh.startAgent = false;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
