{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    gcc
    git
    rustup
    gnumake
    cmake
    hyperfine
  ];
}
