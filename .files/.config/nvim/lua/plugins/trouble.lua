return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
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
}
