{ pkgs, ... }: {
  home.pointerCursor = {
    enable = true;
    package = pkgs.vimix-cursors;
    name = "Vimix Cursors";
    hyprcursor.enable = true;
  };
}
