{
  config,
  pkgs,
  ...
}: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        origin = "bottom-right";
        idle_threshold = 60;
      };

      urgency_low = {
        background = "#333941";
        foreground = "#4a4284";
        timeout = 10;
      };

      urgency_normal = {
        background = "#333941";
        foreground = "#4a4284";
        timeout = 10;
      };

      urgency_critical = {
        background = "#333941";
        foreground = "#ff0044";
      };
    };
  };
}
