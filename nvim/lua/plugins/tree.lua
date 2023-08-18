local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  api.config.mappings.default_on_attach(bufnr)
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  priority = 999,
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("nvim-tree").setup {
      disable_netrw = true,
      hijack_netrw = true,
      respect_buf_cwd = true,
      hijack_cursor = true,
      on_attach = my_on_attach,
      sync_root_with_cwd = true,
      view = {
        cursorline = true,
        width = { min = 30, max = 30, padding = 4 },
        side = "left",
        signcolumn = "no",
        number = false,
        relativenumber = false
      },
      renderer = {
        root_folder_label = false,
        indent_width = 1,
        icons = {
          padding = " ",
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = false,
            modified = false
          }
        }
      }
    }
    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = { 'NvimTree_1' },
      command = 'set termguicolors | hi Cursor blend=100 | set guicursor+=a:Cursor/lCursor'
    })

    vim.api.nvim_create_autocmd(
      "BufLeave",
      {
        pattern = { "NvimTree_1" },
        command = 'set termguicolors | hi Cursor blend=0'
      }
    )
    vim.api.nvim_create_autocmd('VimEnter', {
      pattern = 'NvimTree_1',
      desc = 'Hide Cursor',
      callback = function()
        local hl = vim.api.nvim_get_hl(0, { name = 'Cursor' })
        hl.blend = 100
        vim.api.nvim_set_hl(0, 'Cursor', hl)
        vim.opt.guicursor:append('a:Cursor/lCursor')
      end,
    })
  end
}
