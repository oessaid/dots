require("rust-tools").setup({
  tools = {
    -- rust-tools options
    autoSetHints = true,
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      only_current_line = false,
      show_parameter_hints = true,
      parameter_hints_prefix = " ",
      other_hints_prefix = "→ ",
      max_len_align = false,
      -- max_len_align_padding = 1,
      right_align = false,
      -- right_align_padding = 7,
    },
  },
  server = {
    cmd = { "rust-analyzer" },
    on_attach = require("config.lsp.core").lsp_attach,
    capabilities = require("config.lsp.core").lsp_capabilities,
    settings = {
          ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
})

require("crates").setup({
  null_ls = {
    enabled = false,
    name = "crates",
  },
  popup = {
    show_version_date = true,
  }
})
