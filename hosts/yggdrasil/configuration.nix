# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nvf-configuration.nix
    ../../modules/essentials.nix
    ../../modules/devel-stuff.nix
    ../../modules/gaming.nix
    ../../modules/desktop-env.nix
    ../../modules/emulation.nix
  ];

  boot.loader.grub = {
    enable = true;
    zfsSupport = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
    mirroredBoots = [
      {
        devices = ["nodev"];
        path = "/boot";
      }
    ];
  };

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["yeff"];
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.vhostUserPackages = with pkgs; [virtiofsd];
  virtualisation.spiceUSBRedirection.enable = true;

  networking.hostName = "yggdrasil"; #
  networking.hostId = "78b55724";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Calcutta";

  networking.wg-quick.interfaces.wg0.configFile = "/home/yeff/.wireguard/wg0.conf";

  users.users.yeff = {
    isNormalUser = true;
    extraGroups = ["wheel" "libvirtd"];
  };

  # home-manager = {
  #   extraSpecialArgs = {inherit inputs;};
  #   users = {
  #     "yeff" = import ./home.nix;
  #   };
  # };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;

  services.ollama = {
    enable = true;
    acceleration = "rocm";
    environmentVariables = {
      HCC_AMDGPU_TARGET = "gfx1031";
    };
    rocmOverrideGfx = "10.3.0";
    loadModels = ["gemma3:12b" "deepseek-r1:8b" "llama3.2:3b" "mistral"];
  };
  services.open-webui = {
    port = 8081;
    enable = true;
  };

  networking.firewall.trustedInterfaces = ["wlp15s0" "virbr0"];

  environment.systemPackages = with pkgs; [
    radeontop
    powertop
    nvtopPackages.amd
  ];

  desktop.hyprland.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [8080];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.

  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
