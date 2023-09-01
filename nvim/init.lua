require "lazy-nvim"
require "keymaps"
require "options"

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
    vim.cmd [[set termguicolors | hi Cursor blend=0]]
  end,
})

vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.filetype == 'mason' then
      vim.opt.cursorline = false
      vim.cmd [[set termguicolors | hi Cursor blend=0]]
    elseif vim.bo.filetype == 'lazy' then
      vim.opt.cursorline = false
      vim.cmd [[set termguicolors | hi Cursor blend=0]]
    end
  end,
})


vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    if vim.bo.filetype == "lazy" then
      vim.opt.cursorline = true
      vim.cmd [[set termguicolors | hi Cursor blend=100 | set guicursor+=a:Cursor/lCursor]]
    elseif vim.bo.filetype == "mason" then
      vim.opt.cursorline = true
      vim.cmd [[set termguicolors | hi Cursor blend=100 | set guicursor+=a:Cursor/lCursor]]
    end
  end,
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  pattern = '*.rs',
  nested = true,
  callback = function()
    vim.cmd [[silent write]]
  end
})


vim.api.nvim_create_autocmd('User', {
  pattern = { 'LspProgressUpdate' },
  callback = function()
  end,
})
