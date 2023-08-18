return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end
     map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
     map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
    end,
  },
}
