return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
  opts = {
    position = 'bottom',
    height = 5,
    padding = false,
    fold_open = "",
    fold_closed = "",
    auto_preview = false,
    indent_lines = false,
    include_declaration = {}
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>t",
      function()
        local trouble = require('trouble')
        if not trouble.is_open() then
          trouble.open()
          trouble.action("cancel")
        else
          trouble.close()
        end
      end,
      desc = "Previous trouble/quickfix item",
    },
  },
  config = function()
    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = 'Trouble',
      desc = 'Empty Trouble Buffer',
      callback = function()
        local lines = vim.api.nvim_buf_line_count(0)
        local content = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        local length = string.len(table.concat(content))
        if lines == 1 and length == 0 then
          vim.cmd [[wincmd p]]
        else
          vim.opt.cursorline = true
          vim.cmd [[set termguicolors | hi Cursor blend=100 | set guicursor+=a:Cursor/lCursor]]
        end
      end,
    })

    vim.api.nvim_create_autocmd('BufLeave', {
      pattern = 'Trouble',
      desc = 'Cursor line disable',
      callback = function()
        vim.opt.cursorline = false
        vim.cmd [[set termguicolors | hi Cursor blend=0]]
      end,
    })
  end
}
