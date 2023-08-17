return {
  "folke/flash.nvim",
  opts = {
    search = {
      multi_window = false,
    },
    modes = {
      char = {
        enabled = false,
      },
    }
  },
  keys = {
   { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
