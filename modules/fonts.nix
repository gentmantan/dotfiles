{pkgs, ...}: {
  fonts.packages = with pkgs; [
    liberation_ttf
    nerd-fonts.symbols-only
    maple-mono.truetype
    maple-mono.NF-unhinted
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
}
