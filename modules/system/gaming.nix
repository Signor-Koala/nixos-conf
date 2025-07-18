{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    gamescope
    heroic

    prismlauncher
    (bottles.override {removeWarningPopup = true;})
  ];

  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
