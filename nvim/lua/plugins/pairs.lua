return {
  "echasnovski/mini.pairs",
  version = '*',
  event = { "BufEnter", "BufNewFile" },
  opts = {},
  config = function()
    require('mini.pairs').setup()
  end
}
