return {
  "echasnovski/mini.pairs",
  version = '*',
  lazy = true,
  enabled = false,
  event = { "InsertEnter" },
  opts = {},
  config = function()
    require('mini.pairs').setup()
  end
}
