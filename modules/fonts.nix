{pkgs, ...}: {
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    liberation_ttf
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
}
