local null_ls = require("null-ls")
null_ls.setup({
  on_attach = require("config.lsp.core").lsp_attach,
  sources = {
    null_ls.builtins.formatting.buf,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier.with({
      command = "prettier",
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "css",
        "scss",
        "html",
        "json",
        "yaml",
        "markdown",
        "toml",
      },
    }),
  },
})
