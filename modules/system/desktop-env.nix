{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./desktop-env/hyprland.nix
    ./desktop-env/niri.nix
  ];

  services.displayManager.ly.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    libnotify
    dunst
    bibata-cursors
    fastfetch
    playerctl
    mint-themes
    mint-y-icons
    nwg-look
  ];
}
