{
  config,
  lib,
  pkgs,
  ...
}: {
  options.desktop.niri.enable = lib.mkEnableOption "Enable Niri config";

  config = lib.mkIf config.desktop.niri.enable {
    security.polkit.enable = true;
    services.gnome.gnome-keyring.enable = true;

    programs.niri.enable = true;

    environment.systemPackages = with pkgs; [
      alacritty
      fuzzel
      swaylock
      waybar
      swaybg
    ];
  };
}
