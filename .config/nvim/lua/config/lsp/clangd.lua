require("lspconfig").clangd.setup({
  -- on_attach = custom_clangd_attach,
  on_attach = require("config.lsp.core").lsp_attach,
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    -- -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
    -- -- to add more checks, create .clang-tidy file in the root directory
    -- -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
    "--clang-tidy",
    "--completion-style=bundled",
    "--cross-file-rename",
    "--header-insertion=iwyu",
  },
  init_options = {
    clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  single_file_support = true,
})
