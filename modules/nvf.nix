{pkgs, ...}:
{
  config.vim = {
    viAlias = true;
    vimAlias = true;

    options = {
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
    };

    spellcheck = {
      enable = true;
      programmingWordlist.enable = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      nix.enable = true;
      markdown.enable = true;
      bash.enable = true;
      clang.enable = true;
      html.enable = true;
      css.enable = true;
      ts.enable = true;
      python.enable = true;
    };

    visuals = {
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
      cellular-automaton.enable = true;
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

    autopairs.nvim-autopairs.enable = true;
    autocomplete.blink-cmp.enable = true;
    snippets.luasnip.enable = true;
    filetree.neo-tree.enable = true;
    tabline.nvimBufferline.enable = true;
    treesitter.context.enable = true;

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    telescope.enable = true;

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false;
      neogit.enable = true;
    };

    dashboard.alpha.enable = true;

    utility = {
      diffview-nvim.enable = true;
      smart-splits.enable = true;
      undotree.enable = true;
      motion.leap.enable = true;
    };

    notes.todo-comments.enable = true;

    ui = {
      borders.enable = true;
      noice.enable = true;
      colorizer = {
        enable = true;
        setupOpts.filetypes."*" = {};
      };
      illuminate.enable = true;
      breadcrumbs.enable = true;
    };
    comments.comment-nvim.enable = true;
  };
}
