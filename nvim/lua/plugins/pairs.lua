return {
  "echasnovski/mini.pairs",
  version = '*',
  lazy = true,
  event = { "BufEnter", "BufNewFile" },
  opts = {},
  config = function()
    require('mini.pairs').setup()
  end
}
