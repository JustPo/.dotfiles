return {
  'xbase-lab/xbase',
  build = 'make install',
  requires = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    require 'xbase'.setup({})
  end
}
