return {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
    },
}
