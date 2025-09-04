{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./essentials/shell.nix
    ./essentials/fonts.nix
    ./essentials/kbm.nix
  ];

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  programs.firefox.enable = true;

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  services.flatpak.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    nemo-with-extensions
    nemo-fileroller
    nemo-preview
    file-roller
    mpv
    ffmpeg
    btop
    xed-editor
    feh
    xreader
    libreoffice
    transmission_4-gtk
    gparted
    tree
    spotify-player
    spotify
    vesktop
    krita
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })

    ungoogled-chromium
    helvum
    easyeffects
    pwvucontrol
    networkmanagerapplet
  ];
}
