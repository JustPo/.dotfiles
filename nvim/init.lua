vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require "plugins"
require "options"
require "keymaps"

vim.cmd [[highlight StatusLine guibg=NONE]]
vim.diagnostic.config({
  underline = false,
})

local hl = vim.api.nvim_get_hl(0, { name = 'VertSplit' })
hl.blend = 100
vim.api.nvim_set_hl(0, 'VertSplit', hl)

local function augroup(name)
  return vim.api.nvim_create_augroup("config_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})
