vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require "plugins"
require "options"
require "keymaps"
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { 'NvimTree_1'},
  command = 'set termguicolors | hi Cursor blend=100 | set guicursor+=a:Cursor/lCursor'
})

vim.api.nvim_create_autocmd(
  "BufLeave",
  {
    pattern = { "NvimTree_1" },
    command = 'set termguicolors | hi Cursor blend=0'
  }
)


vim.api.nvim_create_autocmd('VimEnter', {
  pattern = 'NvimTree_1',
  desc = 'Hide Cursor',
  callback = function()
    local hl = vim.api.nvim_get_hl(0, { name = 'Cursor' })
    hl.blend = 100
    vim.api.nvim_set_hl(0, 'Cursor', hl)
    vim.opt.guicursor:append('a:Cursor/lCursor')
    ---@diagnostic disable-next-line: missing-parameter
    require('lualine').hide()
  end,
})

vim.cmd [[highlight StatusLine guibg=NONE]]
vim.diagnostic.config({
  underline = false,
})
local hl = vim.api.nvim_get_hl(0, { name = 'VertSplit' })
hl.blend = 100
vim.api.nvim_set_hl(0, 'VertSplit', hl)

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'Trouble',
  desc = 'Empty Trouble Buffer',
  callback = function()
    local lines = vim.api.nvim_buf_line_count(0)
    local content = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local length = string.len(table.concat(content))
    if lines == 1 and length == 0 then
      vim.cmd [[wincmd p]]
    else
      vim.opt.cursorline = true
      vim.cmd [[set termguicolors | hi Cursor blend=100 | set guicursor+=a:Cursor/lCursor]]
    end
  end,
})

vim.api.nvim_create_autocmd('BufLeave', {
  pattern = 'Trouble',
  desc = 'Cursor line disable',
  callback = function()
    vim.opt.cursorline = false
    vim.cmd[[set termguicolors | hi Cursor blend=0]]
  end,
})


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

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'enable lualine if not nvimTree',
  callback = function()
    if vim.bo.filetype ~= "NvimTree" then
      ---@diagnostic disable-next-line: missing-fields
      require('lualine').hide({ unhide = true })
    end
  end,
})
