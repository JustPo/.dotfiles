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
        NvimTreeCursorLine = { bg = 'none', fg = 'iris' },
        CursorLine = { bg = "#26233a", fg = 'none' },
        StatusLine = { fg = 'love', bg = 'love', blend = 0 },
        Search = { bg = 'gold', inherit = false },
        PmenuSel = { bg = 'none', fg = 'iris' },
        GitSignsAdd = { fg = '#5beb82', bg = 'none' },
        GitSignsChange = { fg = 'rose', bg = 'none' },
        GitSignsDelete = { fg = 'love', bg = 'none' },
        SignAdd = { link = 'GitSignsAdd' },
        SignChange = { link = 'GitSignsChange' },
        SignDelete = { link = 'GitSignsDelete' },
        FloatBorder = { bg = 'none', fg = 'highlight_med' },
        LazyButton = { bg = 'none', fg = '#e0def4' },
        LazyH1 = { bg = 'none', fg = '#e0def4' },
        LazyButtonActive = { bg = 'none', fg = '#e0def4' },
        MasonNormal = { bg = 'none', fg = '#e0def4', default = true },
        MasonHeader = { bold = false, fg = "#e0def4", bg = "none", default = true },
        MasonHeaderSecondary = { bold = true, fg = "#e0def4", bg = "none", default = true },
        MasonHighlight = { fg = "#e0def4", default = true },
        MasonHighlightBlock = { bg = "none", fg = "#e0def4", default = true },
        MasonHighlightBlockBold = { bg = "none", fg = "#e0def4", bold = true, default = true },
        MasonHighlightSecondary = { fg = "#DCA561", default = true },
        MasonHighlightBlockSecondary = { bg = "none", fg = "#e0def4", default = true },
        MasonHighlightBlockBoldSecondary = { bg = "none", fg = "#e0def4", bold = true, default = true },
        MasonLink = { bg = 'none', fg = '#e0def4', default = true },
        MasonMuted = { fg = "#e0def4", default = true },
        MasonMutedBlock = { bg = "none", fg = "#e0def4", default = true },
        MasonMutedBlockBold = { bg = "none", fg = "#e0def4", bold = true, default = true },
        MasonError = { link = "ErrorMsg", default = true },
        MasonWarning = { link = "WarningMsg", default = true },
        MasonHeading = { bold = true, default = true },
        LazySpecial = { bg = 'none', fg = '#e0def4' },
        DiffAdd = { bg = 'none', fg = '#5beb82', blend = 0, default = true },
        DiffChange = { bg = 'none', fg = 'foam' },
        DiffDelete = { bg = 'none', fg = 'love' },
        DiffText = { bg = 'none', fg = 'white' },
        diffAdded = { link = 'DiffAdd' },
        diffChanged = { link = 'DiffChange' },
        diffRemoved = { link = 'DiffDelete' },
        GitSignsDeletePreview = { bg = 'NONE', fg = "love", blend = 0, nocombine = true },
        GitSignsAddPreview = { bg = 'NONE', fg = '#5beb82', blend = 0, nocombine = true },
        GitSignsAddLn = { bg = 'NONE', fg = 'none', blend = 0, nocombine = true }
      }
    }
    require('rose-pine').setup(opts)
    vim.cmd('colorscheme rose-pine')
    vim.cmd [[highlight GitSignsAddPreview guibg=none]]
    vim.cmd [[highlight GitSignsDeletePreview guibg=none]]
  end,
}
