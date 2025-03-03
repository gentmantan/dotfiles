{
  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        set number relativenumber
        filetype plugin indent on
      '';
    };
    vimAlias = true;
    viAlias = true;
  };
}
