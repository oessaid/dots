require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "rust_analyzer",
    "lua_ls",
    "clangd",
    "cmake",
    "dockerls",
    "pyright",
  },
})

local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local navic = require("nvim-navic")
M.lsp_attach = function(client, bufnr)
  -- Location in file
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  -- Format on save
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end

  -- Function signature
  require("lsp_signature").on_attach({
    bind = true,
    hint_prefix = " ",
    handler_opts = {
      border = "none" -- double, rounded, single, shadow, none, or a table of borders
    },
  }, bufnr)

  -- Keymaps
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "<leader>?", "<cmd> lua vim.diagnostic.open_float(nil, {focusable=false, source='always'})<cr>",
    opts)
  buf_set_keymap("n", "<leader>ss", ":SymbolsOutline<cr>", opts)
  buf_set_keymap("n", "<leader>sa", "<cmd> lua vim.lsp.buf.code_action()<cr>", opts)
  buf_set_keymap("n", "<leader>sd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  buf_set_keymap("n", "<leader>si",
    "<cmd>lua require('telescope.builtin').lsp_implementations(require('telescope.themes').get_cursor({}))<cr>", opts)
  buf_set_keymap("n", "<leader>st",
    "<cmd>lua require('telescope.builtin').lsp_type_definitions(require('telescope.themes').get_cursor({}))<cr>", opts)
  buf_set_keymap("n", "<leader>sr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
  buf_set_keymap("n", "<leader>sn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  buf_set_keymap("n", "<leader>s?", ":TroubleToggle document_diagnostics<cr><cr>", opts)
  buf_set_keymap("n", "<leader>sj", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
  buf_set_keymap("n", "<leader>sk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
end

require("neodev").setup()
local lspconfig = require("lspconfig")
M.lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = M.lsp_attach,
      capabilities = M.lsp_capabilities,
    })
  end,
})

-- Documentation in toml specification (Rust crates)
local function show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ 'vim', 'help' }, filetype) then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  elseif vim.tbl_contains({ 'man' }, filetype) then
    vim.cmd('Man ' .. vim.fn.expand('<cword>'))
  elseif vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
    require('crates').show_popup()
  else
    vim.lsp.buf.hover()
  end
end

vim.keymap.set("n", "<leader><leader>", show_documentation, { noremap = true, silent = true })

require("fidget").setup {}

return M
