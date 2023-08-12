return {
  'goolord/alpha-nvim',
  event = "VimEnter",
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require('alpha')
    alpha.setup(require 'alpha.themes.dashboard'.config)
  end
}
