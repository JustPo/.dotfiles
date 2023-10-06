return {
  'stevearc/conform.nvim',
  lazy = true,
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = false,
    },
    formatters_by_ft = {
      swift = { 'swiftformat' },
      lua = { 'stylua' }
    },
  },
  keys = {
    {
      "<C-f>",
      mode = { "n", "x", "o" },
      function()
        require("conform").format({ timeout_ms = 500, lsp_fallback = false })
      end,
      desc = "Format File",
    },
  }
}
