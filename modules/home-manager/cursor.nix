{pkgs, ...}: {
  home.pointerCursor = {
    enable = true;
    package = pkgs.rose-pine-cursor;
    name = "rose-pine-cursor";
  };
}
