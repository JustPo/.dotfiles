return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = function()
    local theme = require('lualine.themes.auto')
    theme.normal.c.bg = 'None'
    theme.inactive.c.bg = 'None'
    theme.visual.c.bg = 'None'
    theme.insert.c.bg = 'None'
    theme.replace.c.bg = 'None'
    theme.command.c.bg = 'None'

    local lualine = require('lualine')
    lualine.setup {
      options = {
        icons_enabled        = true,
        theme                = theme,
        ignore_focus         = { 'NvimTree', 'Trouble' },
        always_divide_middle = false,
        globalstatus         = true,
        refresh              = {
          statusline = 100,
        },
        disabled_filetypes   = {
          statusline = { "alpha" }, winbar = {},
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
          {
            "diagnostics",
            draw_empty = true,
            separator = "",
            always_visible = true,
            color = { fg = 'None', bg = 'None' },
            sections = { 'error', 'warn' },
            padding = {
              left = 0,
              right = 2
            }
          },
          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = { left = 0, right = 1 },
            color = { fg = 'None', bg = 'None' }
          },
          {
            "filename",
            path = 1,
            symbols = { modified = "", readonly = "", unnamed = "" },
            padding = { left = 0, right = 1 },
            color = { fg = 'None', bg = 'None' }
          },
        },
        lualine_z = {
          {
            "branch",
            icon = { '', padding = { left = 0, right = 0 }, color = { fg = '#e17792' } },
            color = { fg = 'None', bg = 'None' }
          }
        },
      },
    }
    lualine.setup({})
    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function()
        if vim.bo.filetype ~= "NvimTree" then
          ---@diagnostic disable-next-line: missing-fields
          require('lualine').hide({ unhide = true })
        end
      end,
    })
  end
}
