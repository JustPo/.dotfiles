return {
  "echasnovski/mini.pairs",
  version = '*',
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
  config = function()
    require('mini.pairs').setup()
  end
}
