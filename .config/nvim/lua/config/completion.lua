local cmp = require("cmp")

cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  formatting = {
    format = function(entry, vim_item)
      -- local icons = require("lsp.kind").icons
      -- vim_item.kind = icons[vim_item.kind]
      vim_item.menu = ({
            nvim_lsp = "[LSP]",
            emoji = "[Emoji]",
            path = "[Path]",
            calc = "[Calc]",
            cmp_tabnine = "[Tabnine]",
            vsnip = "[Snippet]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
          })[entry.source.name]
      vim_item.dup = ({
            buffer = 1,
            path = 1,
            nvim_lsp = 0,
          })[entry.source.name] or 0
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "calc" },
    { name = "treesitter" },
    { name = "crates" },
    { name = "spell" },
  },
  -- preselect = cmp.PreselectMode.Item,

  mapping = {
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
})
