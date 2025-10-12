{
  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        set number relativenumber
        filetype plugin indent on
        set expandtab
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
      '';
    };
    vimAlias = true;
    viAlias = true;
  };
}
