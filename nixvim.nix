{ config, pkgs, lib, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      smartindent = true;
      expandtab = true;
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
    };
    colorschemes.gruvbox.enable = true;
  };
}
