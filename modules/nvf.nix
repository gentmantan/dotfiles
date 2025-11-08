{pkgs, ...}: {
  config.vim = {
    viAlias = true;
    vimAlias = true;

    options = {
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };

    spellcheck = {
      enable = true;
      programmingWordlist.enable = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      nvim-docs-view.enable = true;
      otter-nvim.enable = true;
      trouble.enable = true;
    };

    languages = {
      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;
      html.enable = true;
      markdown.enable = true;
      nix.enable = true;
      python.enable = true;
      sql.enable = true;
      ts.enable = true;
    };

    visuals = {
      cellular-automaton.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
      nvim-cursorline.enable = true;
      nvim-web-devicons.enable = true;
    };

    statusline = {
      lualine = {
        enable = true;
        theme = "gruvbox";
      };
    };

    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
      transparent = false;
    };

    autocomplete.blink-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;
    filetree.neo-tree.enable = true;
    snippets.luasnip.enable = true;
    tabline.nvimBufferline.enable = true;
    treesitter.context.enable = true;

    binds = {
      cheatsheet.enable = true;
      whichKey.enable = true;
    };

    telescope.enable = true;

    git = {
      enable = true;
      gitsigns.codeActions.enable = false;
      gitsigns.enable = true;
      neogit.enable = true;
    };

    dashboard.alpha.enable = true;

    utility = {
      diffview-nvim.enable = true;
      motion.leap.enable = true;
      smart-splits.enable = true;
      undotree.enable = true;
    };

    notes.todo-comments.enable = true;

    ui = {
      borders.enable = true;
      breadcrumbs.enable = true;
      colorizer = {
        enable = true;
        setupOpts.filetypes."*" = {};
      };
      illuminate.enable = true;
      noice.enable = true;
    };
    comments.comment-nvim.enable = true;
  };
}
