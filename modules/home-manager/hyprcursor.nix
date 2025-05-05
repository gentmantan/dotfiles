{ pkgs, ... }: {
  home.pointerCursor = {
    enable = true;
    package = pkgs.rose-pine-hyprcursor;
    name = "rose-pine-hyprcursor";
    hyprcursor = {
      enable = true;
      size = 32;
    };
  };
}
