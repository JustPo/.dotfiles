return {
  'neovim/nvim-lspconfig',
  event = { "BufEnter *.lua", "BufNewFile" },
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',
  },
}
