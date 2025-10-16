{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    heroic

    prismlauncher
  ];

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
