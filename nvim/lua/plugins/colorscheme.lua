return {
  'rose-pine/neovim',
  name = 'rose-pine',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    local opts = {
      variant = 'main',
      dark_variant = 'main',
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = true,
      disable_float_background = true,
      disable_italics = false,

      groups = {
        background = 'base',
        background_nc = '_experimental_nc',
        panel = 'surface',
        panel_nc = 'base',
        border = 'highlight_med',
        comment = 'muted',
        link = 'iris',
        punctuation = 'subtle',

        error = 'love',
        hint = 'iris',
        info = '#FFFFFF',
        warn = '#fc9403',

        headings = {
          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        }
      },

      highlight_groups = {
        ColorColumn = { bg = 'none' },
        NvimTreeCursorLine = { bg = 'none', fg = 'iris'},
        -- CursorLine = { bg = 'none', fg = 'iris' },
        StatusLine = { fg = 'love', bg = 'love', blend = 0 },
        Search = { bg = 'gold', inherit = false },
        PmenuSel = { bg = 'none', fg = 'iris'}
      }
    }
    require('rose-pine').setup(opts)
    vim.cmd('colorscheme rose-pine')
  end,
}
