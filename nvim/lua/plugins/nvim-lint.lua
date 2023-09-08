return {
  'mfussenegger/nvim-lint',
  lazy = true,
  event = { "BufReadPost *.ts" },
  opts = {},
  config = function()
    require('lint').linters_by_ft = {
      ts = { 'eslint' },
      js = { 'eslint' },
      tsx = { 'eslint' }
    }
    vim.api.nvim_create_autocmd({ "BufWritePost *.ts" }, {
      group = vim.api.nvim_create_augroup("config_try_lint", { clear = true }),
      callback = function()
        require("lint").try_lint()
      end,
    })
  end
}
