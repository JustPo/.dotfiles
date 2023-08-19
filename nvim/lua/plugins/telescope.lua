return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    lazy = true,
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = "Telescope",
    keys = {
      {
        "<leader>sf",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Telescope find files",
      },
      {
        "<leader>lg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Telescope live grep",
      },
      {
        "<leader>gf",
        function()
          require("telescope.builtin").git_files()
        end,
        desc = "Telescope git files",
      },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = true,
              ['<C-d>'] = true,
            },
          },
          preview = {
            hide_on_startup = true -- hide previewer when picker starts
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    lazy = true,
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
}
