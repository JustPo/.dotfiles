return {
  'numToStr/Navigator.nvim',
  lazy = false,
  config = function()
    local config = require('Navigator').config
    require('Navigator').setup(config)
  end
}
