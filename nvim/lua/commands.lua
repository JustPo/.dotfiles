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
  group = augroup("trouble_buffer_enter"),
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
  group = augroup("trouble_buffer_leave"),
  pattern = 'Trouble',
  desc = 'Cursor line disable',
  callback = function()
    vim.opt.cursorline = false
    vim.cmd [[set termguicolors | hi Cursor blend=0]]
  end,
})

vim.api.nvim_create_autocmd("WinLeave", {
  group = augroup("floating_window_leave"),
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
  group = augroup("floating_file_type"),
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
  group = augroup("rust_silent_write"),
  pattern = '*.rs',
  nested = true,
  callback = function()
    vim.cmd [[silent write]]
  end
})


vim.api.nvim_create_autocmd('User', {
  group = augroup("lsp_progress_update"),
  pattern = { 'LspProgressUpdate' },
  callback = function()
  end,
})
