return {
  "echasnovski/mini.pairs",
  version = '*',
  lazy = true,
  enable = false,
  event = { "InsertEnter" },
  opts = {},
  config = function()
    require('mini.pairs').setup()
  end
}
