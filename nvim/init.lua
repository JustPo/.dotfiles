require "lazy-nvim"
require "keymaps"
require "options"
require "commands"
--
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = vim.api.nvim_create_augroup("swift_build", { clear = true }),
--   pattern = "*.lua",
--   callback = function()
--     vim.notify("Hello World", 2, {})
--     local file = vim.loop.cwd() .. "/Sources/swiftPackage/test.swift"
--     local swift_format = vim.loop.cwd() ..
--         "/.build/artifacts/swiftpackage/swiftformat/swiftformat.artifactbundle/swiftformat-0.52.2-macos/bin"
--     local job_id = vim.fn.jobstart({ "swiftformat", "--output", "stdout" }, {
--       cwd = swift_format,
--       on_stdout = function(_, data)
--         --vim.api.nvim_buf_set_lines(6, -1, -1, false, data)
--       end,
--       on_stderr = function(_, data)
--         -- vim.api.nvim_buf_set_lines(6, -1, -1, false, data)
--       end
--     })
--     --local text = vim.api.nvim_buf_get_lines(35, 0, -1, false)
--     --print(text)
--     --vim.fn.chansend(job_id, text)
--     --vim.fn.chanclose(job_id, "stdin")
--   end
-- })

  -- vim.api.nvim_create_autocmd("FileType", {
  --   group = vim.api.nvim_create_augroup("help_window", { clear = true }),
  --   pattern = "help"
  --
  -- })
  --local uv = vim.loop
  --local stdin = uv.new_pipe()
  --local stdout = uv.new_pipe()
  --local stderr = uv.new_pipe()
  --local swift_format = vim.loop.cwd() ..
  --    "/.build/artifacts/swiftpackage/swiftformat/swiftformat.artifactbundle/swiftformat-0.52.2-macos/bin"
  --
  --local file = vim.loop.cwd() .. "/Sources/swiftPackage/test.swift"
  --
  --local handle, pid = uv.spawn("swiftformat", {
  --  args = { "stdin" },
  --  cwd = swift_format,
  --  stdio = { stdin, stdout, stderr }
  --}, function(code, signal) -- on exit
  --  print("exit code", code)
  --  print("exit signal", signal)
  --end)
  --
  --print("process opened")
  --
  --if stdout ~= nil then
  --  stdout:read_start(function(err, data)
  --    if data then
  --      print(data)
  --      vim.schedule(function()
  --        vim.api.nvim_buf_set_lines(6, -1, -1, false, { data })
  --      end)
  --    else
  --      print("Std out err")
  --    end
  --  end)
  --end
  --
  --vim.api.nvim_buf_set_lines(6, -1, -1, false, { file })
  --
  --if stderr ~= nil then
  --  stderr:read_start(function(err, data)
  --    if data then
  --      print(data)
  --      vim.schedule(function()
  --        --vim.api.nvim_buf_set_lines(6, -1, -1, false, { data })
  --      end)
  --    else
  --    end
  --  end)
  --end
  --
  --stdin:write(file)

-- local HEIGHT_RATIO = 0.8 -- You can change this
-- local WIDTH_RATIO = 0.5
--
-- local function win_options(win, k, v)
--   if vim.api.nvim_set_option_value then
--     vim.api.nvim_set_option_value(k, v, { scope = "local", win = win })
--   else
--     vim.wo[win][k] = v
--   end
-- end
--
-- local function float_window(query)
--   local buf = vim.api.nvim_create_buf(false, true)
--   local ui = vim.api.nvim_list_uis()[1]
--   local screen_w = vim.opt.columns:get()
--   local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
--   local window_w = screen_w * WIDTH_RATIO
--   local window_h = screen_h * HEIGHT_RATIO
--   local window_w_int = math.floor(window_w)
--   local window_h_int = math.floor(window_h)
--   local center_x = (screen_w - 81) / 2
--   local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
--
--   local opts = {
--     border = "rounded",
--     zindex = 250,
--     relative = "editor",
--     row = center_y,
--     col = center_x,
--     width = 81,
--     title = "Help",
--     style = "minimal",
--     title_pos = "center",
--     height = window_h_int,
--   }
--   vim.bo[buf].syntax = "messages"
--   vim.bo[buf].filetype = "messages"
--   print("hello world")
--   vim.api.nvim_open_win(buf, true, opts)
--   --local messages = vim.fn.execute('messages', true)
--   --local splitted = vim.fn.split(messages, "\n", false)
--   --vim.api.nvim_buf_set_lines(buf, 0, 0, false, splitted)
-- end
--
--
--
-- vim.api.nvim_create_user_command("Help", float_window, {
--   complete = "help",
--   nargs = '?'
-- })
--
-- vim.api.nvim_create_user_command("Messages", float_window, {
-- })
--
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("help_win", { clear = true }),
--   callback = function()
--     local screen_w = vim.opt.columns:get()
--     local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
--     local window_w = screen_w * WIDTH_RATIO
--     local window_h = screen_h * HEIGHT_RATIO
--     local window_w_int = math.floor(window_w)
--     local window_h_int = math.floor(window_h)
--     local center_x = (screen_w - 81) / 2
--     local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
--
--     local opts = {
--       border = "rounded",
--       zindex = 250,
--       relative = "editor",
--       row = center_y,
--       col = center_x,
--       width = 81,
--       title = "Help",
--       title_pos = "center",
--       height = window_h_int,
--     }
--     local win = vim.api.nvim_get_current_win()
--     local buf = vim.api.nvim_get_current_buf()
--     if vim.bo[buf].buftype == "help" then
--       vim.api.nvim_win_set_config(win, opts)
--     end
--   end
-- })
--
-- vim.api.nvim_create_autocmd("CmdlineEnter", {
--   group = vim.api.nvim_create_augroup("help_wqwewqewqewqeeqw", { clear = true }),
--   callback = function ()
--     vim.notify("Hello cmd line", 2, {})
--   end
-- }
