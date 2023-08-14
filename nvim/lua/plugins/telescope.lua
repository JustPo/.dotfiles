return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    lazy = true,
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
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
