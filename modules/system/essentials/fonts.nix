{
  config,
  lib,
  pkgs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      liberation_ttf

      noto-fonts
      noto-fonts-cjk-serif
      noto-fonts-emoji

      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
    ];

    fontconfig = {
      defaultFonts = let
        commonFonts = ["Symbols Nerd Font" "Noto Color Emoji"];
      in {
        serif = ["DejaVu Serif"] ++ commonFonts;
        sansSerif = ["DejaVu Sans"] ++ commonFonts;
        monospace = ["JetBrainsMonoNL Nerd Font Mono"] ++ commonFonts;
        emoji = ["Noto Color Emoji"] ++ commonFonts;
      };
    };
  };
}
