{
  config,
  pkgs,
  ...
}: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        origin = "top-right";
        idle_threshold = 60;
        min_icon_size = 128;
      };

      urgency_low.timeout = 10;
      urgency_normal.timeout = 10;
    };
  };
}
