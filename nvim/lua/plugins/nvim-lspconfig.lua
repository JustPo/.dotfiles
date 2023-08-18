return {
  'neovim/nvim-lspconfig',
  lazy = true,
  event = { "BufEnter *.lua", "BufNewFile" },
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',
  },
}
