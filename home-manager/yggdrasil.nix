{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."niri/config.kdl".source = ./config/niri/yggdrasil.kdl;
  xdg.configFile."hypr".source = ./config/hypr;
  xdg.configFile."hypr".recursive = true;
}
