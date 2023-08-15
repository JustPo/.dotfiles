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
  end
}
