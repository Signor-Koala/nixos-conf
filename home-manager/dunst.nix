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
        min_icon_size = 96;
      };

      urgency_low = {
        foreground = "#eeeeee";
        background = "#333941";
        frame_color = "#4a4284";
        timeout = 10;
      };

      urgency_normal = {
        foreground = "#eeeeee";
        background = "#333941";
        frame_color = "#4a4284";
        timeout = 10;
      };

      urgency_critical = {
        foreground = "#eeeeee";
        background = "#333941";
        frame_color = "#ff0044";
      };
    };
  };
}
