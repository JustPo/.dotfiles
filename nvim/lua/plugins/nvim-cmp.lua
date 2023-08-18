local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local kind_icons = {
  Text = "󰊄",
  Method = "m",
  Function = "󰊕",
  Constructor = "",
  Field = "",
  Variable = "󰫧",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "󰌆",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "󰉺",
}

return {
  'hrsh7th/nvim-cmp',
  lazy = true,
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    'hrsh7th/cmp-nvim-lsp',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local borderstyle = {
      scrollbar = false,
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    }
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require('luasnip.loaders.from_vscode').lazy_load()
    ---@diagnostic disable-next-line: missing-fields
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-e>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            nvim_lua = "[NVIM]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
          })[entry.source.name]
          return vim_item
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
      },
      experimental = {
        native_menu = false,
        ghost_text = false,
      },
      window = {
        ---@diagnostic disable-next-line: missing-fields
        completion = borderstyle,
        documentation = borderstyle
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
    }
    ---@diagnostic disable-next-line: missing-fields
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      },
    })
    ---@diagnostic disable-next-line: missing-fields
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'path' },
        { name = 'cmdline' },
      },
    })
  end
}
