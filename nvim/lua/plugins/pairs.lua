return {
  "echasnovski/mini.pairs",
  version = '*',
  lazy = true,
  enabled = true,
  event = { "InsertEnter" },
  opts = {},
  config = function()
    require('mini.pairs').setup()
  end
}
