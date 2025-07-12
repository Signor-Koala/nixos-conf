{
  config,
  lib,
  pkgs,
  ...
}: {
  options.desktop.hyprland.enable = lib.mkEnableOption "Enable Hyprland config";

  config = lib.mkIf config.desktop.hyprland.enable {
    programs.hyprland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    environment.systemPackages = with pkgs; [
      wofi
      waybar
      psmisc
      hyprpaper
      hyprshot
      hyprpolkitagent
    ];
  };
}
