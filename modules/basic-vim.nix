{
  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        set number relativenumber
	filetype plugin indent on
	tabstop=2
        shiftwidth=2
	expandtab
      '';
    };
    vimAlias = true;
    viAlias = true;
  };
}
