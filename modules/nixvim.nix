{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    opts = {
      expandtab = true;
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      smartindent = true;
      smarttab = true;
      softtabstop= 0;
      tabstop = 8;
    };
    plugins = {
      lualine.enable = true;
      bufferline.enable = true;
      nvim-tree.enable = true;
      nvim-autopairs.enable = true;
      # neorg.enable = true;
      web-devicons.enable = true;
      diffview.enable = true;
      neogit = {
        enable = true;
      };
      comment.enable = true;
      telescope = {
        enable = true;
        extensions = {
          file-browser.enable = true;
        };
        keymaps = {
          "<C-p>" = {
            action = "git_files";
            options = {
              desc = "Telescope Git Files";
            };
          };
          "<leader>fg" = "live_grep";
        };
      };
      indent-blankline.enable = true;
      luasnip.enable = true;
      vimtex.enable = true;
      wrapping = {
        enable = true;
        settings = {
          auto_set_mode_heuristically = true;
        };
      };
      plantuml-syntax.enable = true;
      lsp = {
        enable = true;
        servers = {
          bashls.enable = true;
          marksman.enable = true;
          nixd.enable = true;
          pylsp = {
            enable = true;
            settings.plugins.jedi_completion.enabled = true;
          };
        };
      };
      openscad.enable = true;
      emmet.enable = true;
    };
    colorschemes.gruvbox.enable = true;
  };
}
