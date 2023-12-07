require "lazy-nvim"
require "keymaps"
require "options"
require "commands"
require "debugger-commands"

vim.g.tpipeline_clearstl = 1
vim.o.fcs = "stlnc: ,stl: ,vert: "
vim.opt.fillchars:append({ eob = " " })
