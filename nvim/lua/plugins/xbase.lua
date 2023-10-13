return {
  'xbase-lab/xbase',
  build = 'make install_debug',
  requires = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    require 'xbase'.setup({})
  end
}
