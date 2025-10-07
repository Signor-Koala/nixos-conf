{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      set -U fish_color_param f2cdcd
    ''; # I'm too lazy to fix theming properly
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza";
      l = "${pkgs.eza}/bin/eza -lah";
      ll = "${pkgs.eza}/bin/eza -l";
      la = "${pkgs.eza}/bin/eza -a";
      lt = "${pkgs.eza}/bin/eza --tree";
      lla = "${pkgs.eza}/bin/eza -la";
      ":q" = "exit";
    };
  };

  environment.systemPackages = with pkgs; [
    eza
    fzf
    fishPlugins.done
    fishPlugins.fzf
    fishPlugins.tide
  ];
}
